import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_page.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        titleSpacing: 0,
        title: Text(
          'Checkout (2)',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to: Md. Sifatullah',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4),
                    title: Text(
                      '123 Street, New York, USA 1234567890 123 Street, New York, USA 1234567890',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                    ),
                  ),
                  Text(
                    '1234567890',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4),
                    title: Text(
                      'Bill to the same address',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4),
                    title: Text(
                      'sifatullah.swe.617@gmail.com',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(
                2,
                (index) => Container(
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(top: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Trading International 2',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const ProductInfo(
                            haveQuantity: true,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.cyan.shade900),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: RichText(
                              text: TextSpan(
                                text: 'Standard Delivery\t|\tFREE\t',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 2, 151, 131)),
                                children: [
                                  TextSpan(
                                    text: '৳ 65\n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: 'Receive by 24 Nov - 26 Nov',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(vertical: -4),
                            leading: const Icon(
                              Icons.airplane_ticket_outlined,
                              color: Colors.red,
                            ),
                            horizontalTitleGap: -5,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Store Voucher',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Apply',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15.sp,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '1 items(s). Subtotal: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  TextSpan(
                                      text: '৳ 1,000\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                  TextSpan(
                                      text: 'Saved: ৳ 100',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ])),
                          )
                        ],
                      ),
                    )),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daraz Promotions',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Use Daraz Coins',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Icon(
                        Icons.error_outline,
                        size: 10.sp,
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.confirmation_num_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Daraz Voucher',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        'No Applicable Voucher',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.discount_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Promo Code',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        'Enter Store/Daraz Code',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //order summary
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '৳ 1,000',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Fee',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '৳ 65',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daraz Voucher',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '৳ 0',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Promo Code',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '৳ 0',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '৳ 1,065',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                textAlign: TextAlign.left,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Total: ',
                      style:
                          Theme.of(context).textTheme.titleSmall!.copyWith()),
                  TextSpan(
                      text: '৳ 420\n',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Vat Included, where applicable',
                      style: Theme.of(context).textTheme.bodySmall),
                ])),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                child: Text(
                  'Place Order',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ))
          ],
        ),
      ),
    );
  }
}
