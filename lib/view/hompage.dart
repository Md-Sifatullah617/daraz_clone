import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'address/select_area.dart';
import 'cart/cart_page.dart';
import 'cart/place_order.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daraz'),
        ),
        body: Center(
          child: Column(
            children: [
              //button to navigate to the next pages
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const CartPage());
                },
                child: const Text('Cart Page'),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const PlaceOrderPage());
                },
                child: const Text('Checkout Page'),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const SelectAreaPage());
                },
                child: const Text('Add Address Page'),
              ),
            ],
          ),
        ));
  }
}
