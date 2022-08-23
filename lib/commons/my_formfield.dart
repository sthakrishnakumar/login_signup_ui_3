// ignore: import_of_legacy_library_into_null_safe

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sign_up_3/commons/widgets.dart';

class MyFormField extends StatelessWidget {
  MyFormField({
    Key? key,
    required this.controller,
    required this.lableText,
    this.iconssuffix,
    this.prefixIcon,
    this.obscureText = false,
    this.inputType = TextInputType.emailAddress,
    this.maxlength = 50,
    this.prefixtext,
    this.validator,
    this.isEnabled = true,
    this.dateError,
    this.isDate = false,
  }) : super(key: key);

  final String lableText;
  final TextEditingController controller;
  Widget? iconssuffix;
  IconData? prefixIcon;
  bool obscureText;

  final TextInputType inputType;
  final int? maxlength;
  final String? prefixtext;

  String? Function(String?)? validator;
  bool isEnabled;

  String? dateError;
  bool isDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      maxLength: maxlength,
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: "",
        prefixText: prefixtext,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: dateError == null
              ? BorderSide(color: Colors.grey[500]!, width: 0.5)
              : const BorderSide(color: Colors.red, width: 1),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[400],
          size: 18,
        ),
        suffix: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: iconssuffix,
        ),
        labelText: lableText,
        errorStyle: kerrorTextstyle,
        labelStyle: isDate
            ? GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 12,
              )
            : kinputTextstyle,
        border: kborderStyle,
      ),
    );
  }
}
