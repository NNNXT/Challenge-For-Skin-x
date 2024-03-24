// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/library/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_button.dart';
import 'package:challenge_for_skin_x/widget/custom_listtile.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) => BaseWidget(
        onModelReady: (model) async {
          await model.requestPlaylist();
        },
        builder: (_, model, __) {
          List<Item> listItems = model.listItems;
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  await model.requestPlaylist(reload: true);
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (scrollInfo.isLoadMoreNotification) {
                      model.requestPlaylist();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    itemCount: listItems.length,
                    itemBuilder: (_, index) {
                      Item item = listItems[index];
                      return CustomListTile(
                        playlistId: item.id,
                        imageUrl: (item.images ?? []).isEmpty ? '' : item.toLargestImage,
                        subtitle: item.description,
                        title: item.name,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  onPressed: () async {
                    _textFieldController.clear();
                    await _displayTextInputDialog(
                      context: context,
                      model: model,
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 36,
                  ),
                ),
              ),
            ],
          );
        },
        model: LibraryViewModel(context: context),
      );

  Future<Future> _displayTextInputDialog({
    required BuildContext context,
    required LibraryViewModel model,
  }) async =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: backgroundColor,
          title: Text('library.set_playlist_name'.tr()),
          content: TextFormField(
            controller: _textFieldController,
            cursorColor: mainColor,
            decoration: InputDecoration(
              hintText: 'library.set_playlist_hint'.tr(),
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
            ),
          ),
          actions: <Widget>[
            CustomButton(
              onPressed: () async {
                Navigator.pop(context);
                await model.addPlaylist(
                  playlistName: _textFieldController.value.text.isEmpty
                      ? 'library.set_playlist_hint'.tr()
                      : _textFieldController.value.text,
                );
                await model.requestPlaylist(reload: true);
              },
              text: 'library.create'.tr(),
            ),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'common.cancel'.tr(),
              isMainColor: false,
            ),
          ],
        ),
      );
}
