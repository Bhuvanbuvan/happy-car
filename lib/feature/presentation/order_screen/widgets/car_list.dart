import 'package:flutter/material.dart';
import 'package:happycar/controller/order_controller.dart';
import 'package:happycar/feature/presentation/order_screen/cart_list.dart';

class cartList extends StatelessWidget {
  const cartList({
    super.key,
    required this.controller,
  });
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: CartList.cartList.length,
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.selectCar(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: CarItem(index: index),
            ),
          );
        },
      ),
    );
  }
}

class CarItem extends StatelessWidget {
  const CarItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 110,
      decoration: BoxDecoration(
          color: const Color.fromARGB(212, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(123, 255, 255, 255),
              spreadRadius: 1,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              CartList.cartList[index].image,
              height: 25,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
            Text(
              CartList.cartList[index].title,
            ),
            Text(
              CartList.cartList[index].carDkk,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
