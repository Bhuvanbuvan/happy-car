import 'package:flutter/material.dart';

Widget orderLocations() {
    return Column(
      children: [
        LocationWidget(
          checkedBox: 'assets/icons/checkbox.png',
          location: 'Pickup Location,11ith Street,',
          isKm: false,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        LocationWidget(
          checkedBox: 'assets/icons/greencheck.png',
          location: 'Pickup Location,11ith Street,',
          isKm: true,
        ),
      ],
    );
  }



  //! location widget
  class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.checkedBox,
    required this.location,
    required this.isKm,
  });
  final String checkedBox;
  final String location;
  final bool isKm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              checkedBox,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              location,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),
        !isKm
            ? Text('')
            : Text(
                '11Km',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ],
    );
  }
}