// ignore: import_of_legacy_library_into_null_safe



// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:login_sign_up_3/commons/styles.dart';

class MyFormField extends StatelessWidget {
  MyFormField({
    Key? key,
    required this.controller,
    required this.lableText,
    required this.errormessage,
    required this.iconssuffix,
    required this.prefixIcon,
    required this.obscureText,
    required this.inputType,
    this.maxlength,
    this.prefixtext,
    required this.len,
    this.lengthError,
    this.suffixicon,
  }) : super(key: key);

  final String lableText;
  final TextEditingController controller;
  Widget? iconssuffix;
  IconData? prefixIcon;
  bool obscureText;
  final String errormessage;
  final TextInputType inputType;
  final int? maxlength;
  final String? prefixtext;
  int len;
  final String? lengthError;
  IconData? suffixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlength,
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return errormessage;
        } else if (value.length < len) {
          return lengthError;
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: "",
        prefixText: prefixtext,
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red[500]!,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.blue[500]!,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[500]!, width: 0.5),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[400],
          size: 18,
        ),
        suffixIcon: Icon(
          suffixicon,
          color: Colors.grey[400],
          size: 18,
        ),
        suffix: iconssuffix,
        labelText: lableText,
        errorStyle: kerrorTextstyle,
        labelStyle: kinputTextstyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 40.0, color: Color(0xFFFFFFFF)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
