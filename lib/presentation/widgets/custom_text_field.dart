import 'package:agents_attendance/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? enable;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final bool? obscure;
  final int? maxLine;
  final TextInputAction? inputAction;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.enable,
      this.inputType,
      this.validator,
      this.obscure,
      this.maxLine,
      this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure == null ? false : true,
      textInputAction: inputAction ?? TextInputAction.next,
      enabled: enable,
      minLines: 1,
      maxLines: maxLine ?? 1,
      keyboardType: inputType ?? TextInputType.text,
      cursorColor: AppColors.primary,
      style: const TextStyle(
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: Get.width * 0.03, vertical: 0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xff747D8C),
        ),
      ),
      autofocus: false,
    );
  }
}
