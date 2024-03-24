// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_for_skin_x/constant.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.height = 64.0,
    this.width = 64.0,
    super.key,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        placeholder: (_, __) => CircleAvatar(
          backgroundColor: Colors.grey[200],
        ),
        imageBuilder: (_, image) => CircleAvatar(
          backgroundImage: image,
        ),
        errorWidget: (_, __, ___) => CircleAvatar(
          backgroundColor: backgroundColor,
        ),
      );
}
