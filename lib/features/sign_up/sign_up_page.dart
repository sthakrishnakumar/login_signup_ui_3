import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/export.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with InputValidationMixin {
  late TextEditingController namesController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController dateController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dropDownValue = "Male";
  bool isHidden = true;
  IconData icon = Icons.visibility;
  DateTime? selected;
  String? selectedGender;
  String? genderError;
  String? dateError;

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
  void initState() {
    namesController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    namesController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sizedBox = SizedBox(
      height: size.height * .03,
    );

    return GestureDetector(
      onTap: () => keyboardDismissal(context),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
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
                    items: AppConstant.gender.map((String values) {
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
                      pushReplacementNavigation(context, const LoginPage());
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
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have account?'),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
