// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:challenge_for_skin_x/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    this.isMainColor = true,
    super.key,
  });

  final Function() onPressed;
  final String text;
  final bool isMainColor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isMainColor ? mainColor : Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: isMainColor ? Colors.white : mainColor),
        ),
      );
}
