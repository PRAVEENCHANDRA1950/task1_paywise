import 'package:flutter/material.dart';
import 'package:task_one_paywise/utils/const/app_colors.dart';

class CreateBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CreateBtn({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            backgroundColor: AppColors.primaryColor),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ));
  }
}
