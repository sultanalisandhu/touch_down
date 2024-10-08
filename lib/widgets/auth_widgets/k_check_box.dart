import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';

class CustomCheckbox extends StatelessWidget {
  Color? textColor;
  Color? chkBrderColor;
  CustomCheckbox({super.key, required this.isChecked, required this.onChanged,this.textColor,this.chkBrderColor});

  final RxBool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (bool? value) {
            isChecked.value = value!;
            onChanged(isChecked.value);
          },
          checkColor: Colors.white,
          activeColor: AppColor.primaryColor,
          side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(MaterialState.selected)
                  ? AppColor.primaryColor
                  : chkBrderColor?? AppColor.lightGreyColor,
              width: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
        ),
        Flexible(
          child: Text(
            "I agree with the Terms and Condition and the Privacy Policy.",
            maxLines: 2,
            style: primaryTextStyle(
                fontSize: 10.0, color: textColor?? AppColor.lightGreyColor),
          ),
        ),
      ],
    ));
  }
}


