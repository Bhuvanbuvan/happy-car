import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.lable,
    required this.hintText,
  });

  final TextEditingController controller;
  final String lable;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 80, // Ensure a fixed width
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              children: [
                Text(lable, style: const TextStyle(color: Colors.black87)),
                const SizedBox(width: 5),
                VerticalDivider(
                  color: Colors.black38,
                ),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 0.5,
            ),
          ),
          filled: false,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
