// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/widget/custom_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.imageUrl,
    required this.playlistId,
    required this.subtitle,
    required this.title,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios,
    this.iconSize = 16,
    super.key,
  });

  final String imageUrl;
  final String playlistId;
  final String subtitle;
  final String title;
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        leading: imageUrl.isEmpty
            ? const SizedBox(
                width: 64,
                height: 64,
              )
            : CustomNetworkImage(imageUrl: imageUrl),
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
        trailing: Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
      );
}
