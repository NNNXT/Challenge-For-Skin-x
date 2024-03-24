// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:flutter_svg/svg.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';

enum CustomIconName {
  homeSelected,
  homeUnSelected,
  libaryUnselected,
  searchSelected,
  searchUnSelected,
}

class CustomIcon extends StatelessWidget {
  final CustomIconName name;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit boxFit;

  const CustomIcon(
    this.name, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.boxFit = BoxFit.contain,
  }) : assert(
          (size == null && width == null && height == null) ||
              (size != null && width == null && height == null) ||
              (size == null && (width != null || height != null)),
        );

  Widget _image(String path) => SvgPicture.asset(
        path.imagePath,
        fit: boxFit,
        width: width ?? size,
        height: height ?? size,
      );

  @override
  Widget build(BuildContext context) {
    switch (name) {
      case CustomIconName.homeSelected:
        return _image('home_selected.svg');

      case CustomIconName.homeUnSelected:
        return _image('home_unselected.svg');

      case CustomIconName.libaryUnselected:
        return _image('library_unselected.svg');

      case CustomIconName.searchSelected:
        return _image('search_selected.svg');

      case CustomIconName.searchUnSelected:
        return _image('search_unselected.svg');

      default:
        return const SizedBox.shrink();
    }
  }
}
