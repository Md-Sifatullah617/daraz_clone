import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'place_order.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          centerTitle: true,
          title: Text(
            'My Cart (2)',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Delete',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.red,
                      ),
                )),
          ],
        ),
        body: Stack(
          children: [
            Container(),
            ListView(padding: EdgeInsets.only(bottom: 20.h), children: [
              ...List.generate(3, (index) => const ProductCartSample()),
              //voucher code and apply button
              VoucherSecton(),
              JustForYouSection(),
            ]),
            Positioned(
              bottom: 7,
              left: 0,
              right: 0,
              child: BottomAppBar(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: false,
                              shape: const CircleBorder(),
                              activeColor: Colors.red,
                              onChanged: (value) {}),
                          Text(
                            'All',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Delivery: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                    )),
                            TextSpan(
                                text: '৳ 65',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                            TextSpan(
                                text: '\tFree\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      color: Colors.red,
                                    )),
                            TextSpan(
                                text: 'Total: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.grey,
                                    )),
                            TextSpan(
                                text: '৳ 420',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                          ])),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => const PlaceOrderPage());
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                          child: Text(
                            'Checkout (1)',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class JustForYouSection extends StatelessWidget {
  const JustForYouSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "///\t\t",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
            TextSpan(
              text: 'Just for you',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
                text: "\t\t///",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
          ])),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
              padding: EdgeInsets.only(bottom: 25.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.74,
              ),
              itemCount: 7,
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/shirt.jpeg',
                          height: 100.h,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Men\'s Shirt Cristiano Ronaldo CR7 Juventus Jersey',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            //ratings , total ratings , total sold
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 10.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '3.8/5\t(10)\t.\t1k বিক্রীত',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            //free delivery and voucher
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.green,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    'Free Delivery',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.green),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    '2 Voucher',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: 10.sp, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '৳',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.red,
                                      fontSize: 10.sp,
                                    ),
                              ),
                              TextSpan(
                                text: '\t420\t',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '1000',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      color: Colors.grey.shade700,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ])),
                          ],
                        ),
                      )
                    ],
                  )))
        ]));
  }
}

class VoucherSecton extends StatelessWidget {
  const VoucherSecton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30.h,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Voucher Code',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text(
                'Apply',
                style: Theme.of(context).textTheme.bodyLarge,
              ))
        ],
      ),
    );
  }
}

class ProductCartSample extends StatelessWidget {
  const ProductCartSample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.sp,
                child: Checkbox(
                    value: true,
                    shape: const CircleBorder(),
                    activeColor: Colors.red,
                    onChanged: (value) {}),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                    label: Text(
                      'FabriLife',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You have got free shipping with specific product(s)!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Earliest Delivery: ',
                      style: Theme.of(context).textTheme.titleSmall),
                  TextSpan(
                      text: '23 Nov',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ])),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ProductInfo(),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final bool? haveQuantity;
  const ProductInfo({
    super.key,
    this.haveQuantity = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!haveQuantity!)
          SizedBox(
            width: 20.sp,
            child: Checkbox(
                value: true,
                shape: const CircleBorder(),
                activeColor: Colors.red,
                onChanged: (value) {}),
          ),
        SizedBox(
          width: 5.w,
        ),
        Image.asset(
          'assets/images/shirt.jpeg',
          width: 100.w,
          height: 100.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Men\'s Shirt Cristiano Ronaldo CR7 Juventus Jersey',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
              Text(
                'Brand Name, Color Family: Multicolor',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Free Delivery',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10.sp, color: Colors.green),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '৳ 20',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '৳ 420',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                )),
                        TextSpan(
                            text: '\t\t-60%',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.grey.shade700,
                                )),
                      ])),
                    ],
                  ),
                  // plus minus button
                  if (!haveQuantity!)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('-',
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text('1',
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '+',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  if (haveQuantity!)
                    Text(
                      'Qty: 1',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
