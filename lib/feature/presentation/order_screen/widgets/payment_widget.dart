import 'package:flutter/material.dart';

class paymentWidget extends StatelessWidget {
  const paymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        SizedBox(
          height: 5,
        ),
        Text("Payment Method"),
        Row(
          children: [
            Row(
              children: [
                Image.asset("assets/icons/mastercard.png"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  ".... 4383",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "Change",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: Colors.black87,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
