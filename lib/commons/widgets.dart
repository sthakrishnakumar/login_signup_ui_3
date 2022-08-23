import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kinputTextstyle =
    GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]);
TextStyle kerrorTextstyle =
    GoogleFonts.poppins(fontSize: 10, color: Colors.red[400]);
TextStyle kDOBGenderstyle =
    GoogleFonts.poppins(fontSize: 14, color: Colors.black);
TextStyle ktextstyle = GoogleFonts.poppins(
    fontSize: 10, color: Colors.grey[800], fontWeight: FontWeight.w500);

InputBorder kborderStyle = const OutlineInputBorder(
  borderSide: BorderSide(
    width: 40.0,
    color: Color(0xFFFFFFFF),
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

void snackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 300),
      content: Text(message),
    ),
  );
}

void keyboardDismissal(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    return currentFocus.unfocus();
  }
}
