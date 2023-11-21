import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            'Order Details',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.red.shade300,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Payment pending",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Due by 1:00 PM, 12th July 2021",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            //name phone number address
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ship & Bill",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "9876543210",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            //order details
            Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.card_giftcard_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Package 1",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
