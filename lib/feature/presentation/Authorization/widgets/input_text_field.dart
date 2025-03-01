import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.lable,
    required this.hintText,
    required this.validator,
    required this.height,
  });

  final TextEditingController controller;
  final String lable;
  final String hintText;
  final String? Function(String?) validator;
  final bool height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ? 80 : 55,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: Container(
            width: lable.length <= 7 ? 80 : 100, // Ensure a fixed width
            padding: EdgeInsets.only(
                left: 10, top: height ? 20 : 10, bottom: height ? 20 : 10),
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 0.8,
            ),
          ),
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
