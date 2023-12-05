import 'package:daraz_clone/controller/address_controller.dart';
import 'package:daraz_clone/utils/custom_widget/custom_bottom_sheet.dart';
import 'package:daraz_clone/utils/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectAreaPage extends StatelessWidget {
  const SelectAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 15.sp,
            )),
        centerTitle: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(Get.width * 0.02),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Get.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    CustomFieldText(
                      txtcontroller: controller.fullNameController,
                      title: "Full Name",
                      hintText: 'Input full Name',
                    ),
                    Divider(
                      thickness: 0.6,
                      endIndent: Get.width * 0.02,
                    ),
                    CustomFieldText(
                      txtcontroller: controller.phoneNumberController,
                      title: "Mobile Number",
                      hintText: 'Input Mobile Number',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(Get.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        customBottomSheet(context);
                      },
                      child: AbsorbPointer(
                        child: CustomFieldText(
                          isSuffix: false,
                          txtcontroller: controller.fullAreaController,
                          title: "Area",
                          hintText: 'Select the region, city, area',
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.6,
                      endIndent: Get.width * 0.02,
                    ),
                    CustomFieldText(
                      txtcontroller: controller.addressController,
                      title: "Address",
                      hintText: 'House no. / Building / Street / Area',
                    ),
                    Divider(
                      thickness: 0.6,
                      endIndent: Get.width * 0.02,
                    ),
                    CustomFieldText(
                      txtcontroller: controller.landMarkController,
                      title: "Landmark (Optional)",
                      hintText: 'E.g. Opposite City Hospital',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(Get.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address Label (Optional)",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: Get.height * 0.05,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02,
                              vertical: Get.height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Office',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: Get.height * 0.05,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02,
                              vertical: Get.height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Default Delivery Address",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Switch(value: true, onChanged: (value) {})
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Default Billing Address",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Switch(value: false, onChanged: (value) {})
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.02),
          child: Container(
            height: Get.height * 0.04,
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02,
              vertical: Get.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Save',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
