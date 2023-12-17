import 'package:daraz_clone/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text_field.dart';

void customBottomSheet(context) {
  Get.bottomSheet(
    isScrollControlled: true,
    GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) => Container(
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
                    controller.divisionController.clear();
                    controller.districtController.clear();
                    controller.areaController.clear();
                    Get.back();
                  },
                  child: Text('Close',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                const Spacer(),
                Text(
                  'Select Your Area',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: Get.height * 0.02,
                        width: Get.width * 0.02,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                      if (controller.divisionController.text.isNotEmpty)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: Get.height * 0.025,
                          width: Get.width * 0.007,
                          decoration: BoxDecoration(
                              color: controller.districtController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.red,
                              shape: BoxShape.rectangle),
                        ),
                      if (controller.divisionController.text.isNotEmpty)
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: Get.height * 0.02,
                          width: Get.width * 0.02,
                          decoration: BoxDecoration(
                              color: controller.districtController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.red,
                              shape: BoxShape.circle),
                        ),
                      if (controller.districtController.text.isNotEmpty)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: Get.height * 0.025,
                          width: Get.width * 0.007,
                          decoration: BoxDecoration(
                              color: controller.areaController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.red,
                              shape: BoxShape.rectangle),
                        ),
                      if (controller.districtController.text.isNotEmpty)
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: Get.height * 0.02,
                          width: Get.width * 0.02,
                          decoration: BoxDecoration(
                              color: controller.areaController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.red,
                              shape: BoxShape.circle),
                        ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomFieldText(
                          isEnable: false,
                          isSuffix: false,
                          txtcontroller: controller.divisionController,
                          title: "Division",
                          hintText: 'Select the division',
                        ),
                        if (controller.divisionController.text.isNotEmpty)
                          CustomFieldText(
                            isEnable: false,
                            isSuffix: false,
                            txtcontroller: controller.districtController,
                            title: "District",
                            hintText: 'Select the district',
                          ),
                        if (controller.districtController.text.isNotEmpty)
                          CustomFieldText(
                            isEnable: false,
                            isSuffix: false,
                            txtcontroller: controller.areaController,
                            title: "Area",
                            hintText: 'Select the area',
                          ),
                      ],
                    ),
                  )
                ])),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
                textAlign: TextAlign.left,
                controller.divisionController.text.isEmpty
                    ? "Select The Division"
                    : controller.districtController.text.isEmpty
                        ? "Select The District"
                        : "Select The Area",
                style: Theme.of(context).textTheme.bodyMedium),
            Container(
              height: controller.divisionController.text.isEmpty
                  ? Get.height * 0.53
                  : controller.districtController.text.isEmpty
                      ? Get.height * 0.49
                      : controller.areaController.text.isEmpty
                          ? Get.height * 0.45
                          : Get.height * 0.45,
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.02,
                vertical: Get.height * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                vertical: Get.height * 0.01,
                horizontal: Get.width * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    )
                  : ListView.builder(
                      itemCount: controller.divisionController.text.isEmpty
                          ? controller.divisionList.length
                          : controller.districtController.text.isEmpty
                              ? controller.districtList.length
                              : controller.areaList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          if (controller.divisionController.text.isEmpty) {
                            controller.divisionController.text =
                                controller.divisionList[index].name!.toString();
                            controller.districtController.text = '';
                            controller.areaController.text = '';
                            controller.update();
                          } else if (controller
                              .districtController.text.isEmpty) {
                            controller.districtController.text =
                                controller.districtList[index].name!.toString();
                            controller.areaController.text = '';
                            controller.update();
                          } else {
                            controller.areaController.text =
                                controller.areaList[index].name!.toString();
                            controller.update();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.02,
                            vertical: Get.height * 0.01,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.divisionController.text.isEmpty
                                    ? controller.divisionList[index].name!
                                    : controller.districtController.text.isEmpty
                                        ? controller.districtList[index].name!
                                        : controller.areaList[index].name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (index != controller.divisionList.length - 1)
                                Divider(
                                  thickness: 0.6,
                                  endIndent: Get.width * 0.02,
                                  color: Colors.grey.shade300,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                controller.fullAreaController.text =
                    "${controller.divisionController.text}, ${controller.districtController.text}, ${controller.areaController.text}";
                Get.back();
              },
              child: Container(
                height: Get.height * 0.05,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Save & Continue',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
