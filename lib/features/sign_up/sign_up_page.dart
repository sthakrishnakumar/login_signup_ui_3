import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sign_up_3/commons/mixins.dart';

import '../../commons/my_formfield.dart';
import '../login/login_page.dart';

// ignore: use_key_in_widget_constructors
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with InputValidationMixin {
  TextEditingController namesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dropDownValue = "Male";
  bool isHidden = true;
  IconData icon = Icons.visibility;
  String? selectedGender;

  List<String> gender = ["Male", "Female", "Others"];

  void keyboardDismiss() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      return currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: keyboardDismiss,
      child: Scaffold(
        body: Form(
          key: formKey,
          // ignore: sized_box_for_whitespace
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              SizedBox(
                height: size.height * .04,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .08,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  inputType: TextInputType.name,
                  controller: namesController,
                  lableText: "Full Name",
                  obscureText: false,
                  prefixIcon: Icons.person,
                  iconssuffix: null,
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  controller: emailController,
                  lableText: 'Email',
                  prefixIcon: Icons.mail_outline,
                  inputType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  inputType: TextInputType.emailAddress,
                  obscureText: isHidden,
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  lableText: 'Password',
                  iconssuffix: InkWell(
                    onTap: () {
                      if (isHidden == true) {
                        isHidden = false;
                        icon = Icons.visibility;
                      } else {
                        isHidden = true;
                        icon = Icons.visibility_off;
                      }
                      setState(() {});
                    },
                    child: Icon(
                      icon,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  validator: (phone) =>
                      isPhoneValid(phone!) ? null : 'Invalid Phone Number',
                  prefixtext: '+977',
                  maxlength: 10,
                  inputType: TextInputType.phone,
                  controller: phoneController,
                  lableText: "Phone Number",
                  obscureText: false,
                  prefixIcon: Icons.phone,
                  iconssuffix: null,
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30, right: 30),
              //   child: DateTimeFormField(
              //     decoration: InputDecoration(
              //       contentPadding: const EdgeInsets.all(10),
              //       hintStyle: TextStyle(color: Colors.grey[500]),
              //       errorStyle: const TextStyle(color: Colors.redAccent),
              //       prefixIcon: const SizedBox(),
              //       suffixIcon: Icon(Icons.calendar_today,
              //           color: Colors.grey[400], size: 18),
              //       labelText: 'Date Of Birth',
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(15),
              //         borderSide:
              //             BorderSide(color: Colors.grey[500]!, width: 0.5),
              //       ),
              //       labelStyle: kinputTextstyle,
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(15),
              //         borderSide: BorderSide(
              //           color: Colors.blue[500]!,
              //           width: 0.5,
              //         ),
              //       ),
              //       errorBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(15),
              //         borderSide: const BorderSide(
              //           color: Colors.red,
              //           width: 1,
              //         ),
              //       ),
              //     ),
              //     mode: DateTimeFieldPickerMode.date,
              //     autovalidateMode: AutovalidateMode.onUserInteraction,
              //     validator: (e) =>
              //         e?.day == null ? 'Please Choose a Date' : null,
              //     onDateSelected: (DateTime value) {
              //       // ignore: avoid_print
              //       print(value);
              //     },
              //   ),
              // ),

              SizedBox(
                height: size.height * .04,
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      'Select Gender',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                    isExpanded: true,
                    value: selectedGender,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: gender.map((String values) {
                      return DropdownMenuItem<String>(
                        value: values,
                        child: Text(values),
                      );
                    }).toList(),
                    onChanged: (gender) {
                      setState(() {
                        selectedGender = gender;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        "Sign UP",
                        style: GoogleFonts.poppins(fontSize: 13),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
