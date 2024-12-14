import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key, required this.controller, required this.hint, this.maxLines});
  final TextEditingController controller;
  final String hint;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEEEEEE))),
        hintText: hint,
      ),
    ).container(padding: const EdgeInsets.only(top: 25));
  }
}
