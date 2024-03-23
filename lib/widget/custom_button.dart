// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:challenge_for_skin_x/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      );
}
