import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomFieldText extends StatelessWidget {
  final bool? isEnable;
  final bool? isSuffix;
  final TextEditingController txtcontroller;
  final String? hintText;
  final String? title;
  const CustomFieldText({
    super.key,
    required this.txtcontroller,
    this.hintText,
    this.title,
    this.isEnable,
    this.isSuffix,
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            decoration: InputDecoration(
              enabled: isEnable ?? true,
              constraints: BoxConstraints(
                maxHeight: 30.h,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
              hintText: hintText!,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
              suffix: isSuffix ?? true
                  ? ValueListenableBuilder(
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
                    )
                  : null,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
