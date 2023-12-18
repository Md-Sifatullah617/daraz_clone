import 'package:daraz_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void foodPandaBottomSheet(context, {required Map data}) {
  Get.bottomSheet(
    isScrollControlled: true,
    enableDrag: false,
    Container(
      height: Get.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.25,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(data['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.02,
                left: Get.width * 0.02,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.08,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.foodpandaColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.02,
            ),
            height: Get.height * 0.65,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Beena\'s Kitchen',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          text: 'Tk 165\n',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                          children: [
                            TextSpan(
                              text: 'from Tk 200',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget nunc vitae tortor aliquam aliquet.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    const Divider(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      height: Get.height * 0.25,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Beena\'s Kitchen',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            subtitle: Text(
                              'Select one',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.foodpandaColor,
                                  ),
                            ),
                            trailing: Container(
                              height: Get.height * 0.04,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: AppColors.foodpandaColor,
                                borderRadius: BorderRadius.circular(25.h),
                              ),
                              child: Center(
                                child: Text(
                                  'Required',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          //half and full
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            controlAffinity: ListTileControlAffinity.leading,
                            checkboxShape: const CircleBorder(),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Full',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Tk 165',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                    Text(
                                      'Tk 200',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.red,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            value: true,
                            onChanged: (value) {},
                          ),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            controlAffinity: ListTileControlAffinity.leading,
                            checkboxShape: const CircleBorder(),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Half',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Tk 165',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                    Text(
                                      'Tk 200',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.red,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    const Divider(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'Special Instructions',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget nunc vitae tortor aliquam aliquet.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    //example text field
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'e.g. no mayo',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'If this product is not available',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'e.g. no mayo',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            height: Get.height * 0.08,
            width: Get.width,
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.02,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //increment decrement button
                Container(
                  height: Get.height * 0.04,
                  width: Get.width * 0.08,
                  decoration: BoxDecoration(
                    color: AppColors.foodpandaColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Container(
                  height: Get.height * 0.04,
                  width: Get.width * 0.08,
                  decoration: BoxDecoration(
                    color: AppColors.foodpandaColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
