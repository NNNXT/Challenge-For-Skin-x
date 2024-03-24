// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:go_router/go_router.dart';

// Internal Modules
import 'package:challenge_for_skin_x/navigator_route.dart';
import 'package:challenge_for_skin_x/widget/custom_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.imageUrl,
    required this.playlistId,
    required this.subtitle,
    required this.title,
    super.key,
  });

  final String imageUrl;
  final String playlistId;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          context.go(
            NavigatorRoutePath.playlistDetail.goPath,
            extra: playlistId,
          );
        },
        leading: CustomNetworkImage(imageUrl: imageUrl),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: subtitle.isEmpty
            ? null
            : Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
      );
}
