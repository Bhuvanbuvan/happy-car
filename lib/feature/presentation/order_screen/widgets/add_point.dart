import 'package:flutter/material.dart';

class addPoint extends StatelessWidget {
  const addPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20,
      ),
      child: Row(
        children: [
          Text(
            "+ Add point",
            style: TextStyle(
              fontSize: 19,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}