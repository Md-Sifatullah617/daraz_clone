import 'package:daraz_clone/controller/address_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Container(
                            height: Get.height * 0.8,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05,
                              vertical: Get.height * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text('Close',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Select Your Area',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                //show the selected value with steepers
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: EasyStepper(
                                    activeStep: controller.activeStep.value,
                                    direction: Axis.vertical,
                                    lineStyle: LineStyle(
                                      lineLength: Get.height * 0.02,
                                      lineSpace: 0,
                                      lineType: LineType.normal,
                                      defaultLineColor: Colors.white,
                                      finishedLineColor: Colors.orange,
                                    ),
                                    activeStepTextColor: Colors.black87,
                                    finishedStepTextColor: Colors.black87,
                                    internalPadding: 0,
                                    showLoadingAnimation: false,
                                    stepRadius: 8,
                                    showStepBorder: false,
                                    steps: [
                                      EasyStep(
                                        customStep: CircleAvatar(
                                          radius: 7,
                                          backgroundColor:
                                              controller.activeStep.value >= 0
                                                  ? Colors.orange
                                                  : Colors.white,
                                        ),
                                        title: 'Waiting',
                                      ),
                                      EasyStep(
                                        customStep: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 7,
                                            backgroundColor:
                                                controller.activeStep.value >= 1
                                                    ? Colors.orange
                                                    : Colors.white,
                                          ),
                                        ),
                                        title: 'Order Received',
                                        topTitle: true,
                                      ),
                                      EasyStep(
                                        customStep: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 7,
                                            backgroundColor:
                                                controller.activeStep.value >= 2
                                                    ? Colors.orange
                                                    : Colors.white,
                                          ),
                                        ),
                                        title: 'Preparing',
                                      ),
                                    ],
                                    onStepReached: (index) {
                                      controller.activeStep.value = index;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Text(
                                    textAlign: TextAlign.left,
                                    controller.activeStep.value == 0
                                        ? "Select The Division"
                                        : controller.activeStep.value == 1
                                            ? "Select The District"
                                            : "Select The Area",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Container(
                                  height: Get.height * 0.5,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02,
                                    vertical: Get.height * 0.01,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.02,
                                    horizontal: Get.width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListView.builder(
                                    itemCount: controller.activeStep.value == 0
                                        ? controller.divisionList.length
                                        : controller.activeStep.value == 1
                                            ? controller.districtList.length
                                            : controller.areaList.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            if (controller.activeStep.value ==
                                                0) {
                                              controller
                                                      .selectedDivision.value =
                                                  controller.divisionList[index]
                                                      .name!;
                                              controller.activeStep.value = 1;
                                            } else if (controller
                                                    .activeStep.value ==
                                                1) {
                                              controller
                                                      .selectedDistrict.value =
                                                  controller.districtList[index]
                                                      .name!;
                                              controller.activeStep.value = 2;
                                            } else {
                                              controller.selectedArea.value =
                                                  controller
                                                      .areaList[index].name!;
                                            }
                                          },
                                          title: Text(
                                            controller.activeStep.value == 0
                                                ? controller
                                                    .divisionList[index].name!
                                                : controller.activeStep.value ==
                                                        1
                                                    ? controller
                                                        .districtList[index]
                                                        .name!
                                                    : controller
                                                        .areaList[index].name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          //if  last index not show
                                          subtitle: index !=
                                                  controller
                                                          .divisionList.length -
                                                      1
                                              ? Divider(
                                                  thickness: 0.6,
                                                  endIndent: Get.width * 0.02,
                                                  color: Colors.grey.shade300,
                                                )
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: AbsorbPointer(
                        child: CustomFieldText(
                          txtcontroller: controller.fullNameController,
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
                      txtcontroller: controller.phoneNumberController,
                      title: "Address",
                      hintText: 'House no. / Building / Street / Area',
                    ),
                    Divider(
                      thickness: 0.6,
                      endIndent: Get.width * 0.02,
                    ),
                    CustomFieldText(
                      txtcontroller: controller.phoneNumberController,
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
                            height: Get.height * 0.04,
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
                            height: Get.height * 0.04,
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

class CustomFieldText extends StatelessWidget {
  final TextEditingController txtcontroller;
  final String? hintText;
  final String? title;
  const CustomFieldText({
    super.key,
    required this.txtcontroller,
    this.hintText,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: TextFormField(
            controller: txtcontroller,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                maxHeight: 30.h,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
              hintText: hintText!,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
              suffix: ValueListenableBuilder(
                valueListenable: txtcontroller,
                builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    txtcontroller.clear();
                  },
                  child: Icon(
                    FontAwesomeIcons.circleXmark,
                    size: 15.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
