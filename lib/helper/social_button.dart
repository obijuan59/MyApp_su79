import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;

  const SocialButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(12),
      ),
      child: Image.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
    );
  }
}
