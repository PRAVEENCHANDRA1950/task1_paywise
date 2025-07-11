import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const InputFields(
      {super.key,
      required this.controller,
      required this.label,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: label, label: Text(label), border: OutlineInputBorder()),
      ),
    );
  }
}
