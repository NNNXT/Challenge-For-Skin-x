// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_detail.dart';
import 'package:challenge_for_skin_x/model/playlist/track.dart';
import 'package:challenge_for_skin_x/src/features/playlist_deatil/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_listtile.dart';
import 'package:challenge_for_skin_x/widget/custom_network_image.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final String playlistId;

  const PlaylistDetailScreen({
    required this.playlistId,
    super.key,
  });

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        onModelReady: (model) async {
          model
            ..requestPlaylistDetail(playlistId: widget.playlistId)
            ..requestPlaylistDetailTracks(playlistId: widget.playlistId);
        },
        builder: (_, model, __) {
          PlaylistDetail? playlistDetail = model.playlistDetail;
          String ownerDisplayName = playlistDetail?.owner?.displayName ?? '';
          return Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundColor,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                playlistDetail?.name ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: playlistDetail == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: mainColor,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.isLoadMoreNotification) {
                          model.requestPlaylistDetailTracks(playlistId: widget.playlistId);
                          return true;
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((playlistDetail.images ?? []).isNotEmpty)
                              playlistImage(imageUrl: playlistDetail.toLargestImage),
                            if (playlistDetail.description.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(playlistDetail.description),
                            ],
                            if (ownerDisplayName.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text('playlist_detail.owner'.tr(args: [ownerDisplayName])),
                            ],
                            const SizedBox(height: 8),
                            ListView.separated(
                              itemCount: model.listTracks.length,
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                Track? track = model.listTracks[index].track;

                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: (track?.album?.toLargestImage ?? '').isEmpty
                                      ? const SizedBox.shrink()
                                      : CustomNetworkImage(
                                          imageUrl: track?.album?.toLargestImage ?? '',
                                        ),
                                  title: Text(
                                    track?.name ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    '${track?.prettyDurationMs ?? ''} ${track?.artistsDisplay ?? ''}\n${track?.album?.name ?? ''}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      if (model.listItems.isEmpty) {
                                        await model.requestPlaylist();
                                      }

                                      if (!context.mounted) return;
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (context) => ColoredBox(
                                          color: backgroundColor,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Expanded(
                                                child: ListView.separated(
                                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                                  itemCount: model.listItems.length,
                                                  itemBuilder: (_, index) {
                                                    Item item = model.listItems[index];
                                                    String itemId = item.id;
                                                    return CustomListTile(
                                                      onTap: () async {
                                                        await model.addItemsToPlasyList(
                                                          playlistId: itemId,
                                                          trackURI: track?.uri ?? '',
                                                        );
                                                        if (!context.mounted) return;
                                                        Navigator.pop(context);
                                                      },
                                                      playlistId: itemId,
                                                      imageUrl: (item.images ?? []).isEmpty ? '' : item.toLargestImage,
                                                      subtitle: item.description,
                                                      title: item.name,
                                                      icon: Icons.playlist_add,
                                                      iconSize: 24,
                                                    );
                                                  },
                                                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
        model: PlaylistDetailViewModel(context: context),
      );

  Widget playlistImage({required String imageUrl}) => Center(
        child: CachedNetworkImage(
          height: 256,
          width: 256,
          imageUrl: imageUrl,
          placeholder: (_, __) => Container(
            color: Colors.grey[200],
          ),
          imageBuilder: (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          errorWidget: (_, __, ___) => CircleAvatar(
            backgroundColor: backgroundColor,
          ),
        ),
      );
}
