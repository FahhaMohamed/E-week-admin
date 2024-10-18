import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:flutter/material.dart';

Widget customTextFeild(BuildContext context,
    {String? hinText,
    String? labelText,
    TextInputType? keyboardType,
    required TextEditingController textEditingController,
    Function(String)? onChanged}) {
  return TextFormField(
    keyboardType: keyboardType,
    onChanged: onChanged,
    controller: textEditingController,
    cursorColor: AppColors.iconColor,
    onTapOutside: (event) => FocusScope.of(context).unfocus(),
    cursorHeight: 17,
    style: const TextStyle(
        fontSize: 14,
        color: AppColors.iconColor,
        decoration: TextDecoration.none),
    decoration: InputDecoration(
      label: labelText != null ? eventText(text: labelText) : null,
      hintText: hinText,
      hintStyle: const TextStyle(fontSize: 14),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.shadowColor)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.iconColor)),
    ),
  );
}
