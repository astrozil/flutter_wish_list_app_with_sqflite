import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  const CustomTextFieldWidget({super.key, required this.textEditingController, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.black
          )
        ),
        label: Text(label)
      ),
    );
  }
}
