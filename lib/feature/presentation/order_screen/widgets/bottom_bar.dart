import 'package:flutter/material.dart';

class bottomBar extends StatelessWidget {
  const bottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 34,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF0A84FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
