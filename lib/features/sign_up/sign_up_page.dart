import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
  DateTime? selected;
  String? selectedGender;
  String? genderError;
  String? dateError;

  List<String> gender = ["Male", "Female", "Others"];

  void keyboardDismiss() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      return currentFocus.unfocus();
    }
  }

  bool isValid = false;

  validate() {
    setState(() {
      isValid = formKey.currentState!.validate();
    });

    if (selectedGender == null) {
      setState(() {
        genderError = 'Error';
      });
      isValid = false;
    }
    if (selected == null) {
      setState(() {
        dateError = 'Error Date';
      });
      isValid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sizedBox = SizedBox(
      height: size.height * .03,
    );

    return GestureDetector(
      onTap: keyboardDismiss,
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          // ignore: sized_box_for_whitespace
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              sizedBox,
              sizedBox,
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
                  validator: (name) =>
                      isNameValid(name!) ? null : "Enter Valid Name",
                  inputType: TextInputType.name,
                  controller: namesController,
                  lableText: "Full Name",
                  obscureText: false,
                  prefixIcon: Icons.person,
                  iconssuffix: null,
                ),
              ),
              sizedBox,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  validator: (email) =>
                      isEmailValid(email!) ? null : "Enter Valid Email",
                  controller: emailController,
                  lableText: 'Email',
                  prefixIcon: Icons.mail_outline,
                  inputType: TextInputType.emailAddress,
                ),
              ),
              sizedBox,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyFormField(
                  validator: (password) => isPasswordValid(password!)
                      ? null
                      : "Enter Valid Password",
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
              sizedBox,
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
              sizedBox,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                  onTap: () async {
                    selected = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1964),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.green,
                              ),
                            ),
                            child: child!,
                          );
                        });
                    final myDate = DateFormat('d MMM y').format(selected!);
                    setState(() {
                      dateController.text = myDate;
                      dateError = null;
                    });
                  },
                  child: MyFormField(
                    dateError: dateError,
                    isDate: dateError == null ? false : true,
                    prefixIcon: Icons.calendar_month,
                    controller: dateController,
                    lableText: dateError == null
                        ? 'Date of Birth'
                        : 'Please Select DOB',
                    isEnabled: false,
                  ),
                ),
              ),
              sizedBox,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(10),
                height: size.height * 0.055,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: genderError == null ? 0.5 : 1.0,
                    color: genderError == null ? Colors.grey[400]! : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: genderError == null
                        ? Text(
                            'Select Gender',
                            style: GoogleFonts.poppins(fontSize: 13),
                          )
                        : Text(
                            'Please Select Gender',
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: Colors.red),
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
                        genderError = null;
                      });
                    },
                  ),
                ),
              ),
              sizedBox,
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
                    validate();
                    if (isValid) {
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
