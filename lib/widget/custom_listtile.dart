// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:challenge_for_skin_x/widget/custom_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.imageUrl,
    required this.subtitle,
    required this.title,
    super.key,
  });

  final String imageUrl;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: CustomNetworkImage(imageUrl: imageUrl),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          style: const TextStyle(color: Colors.white),
        ),
      );
}
