import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sign_up_3/commons/app_constant.dart';
import 'package:login_sign_up_3/commons/mixins.dart';
import 'package:lottie/lottie.dart';

import '../../commons/my_formfield.dart';
import '../../commons/widgets.dart';
import '../sign_up/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidden = true;
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sizedBox = SizedBox(
      height: size.height * 0.03,
    );
    return SafeArea(
      child: GestureDetector(
        onTap: () => keyboardDismissal(context),
        child: Scaffold(
          body: Form(
            key: formKey,
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              height: size.height,
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    sizedBox,
                    SizedBox(
                      height: size.height * 0.5,
                      child: Lottie.network(
                        AppConstant.loginLottie,
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: MyFormField(
                        validator: (email) {
                          return isEmailValid(email!)
                              ? null
                              : "Enter Valid Email";
                        },
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
                        validator: (password) {
                          return isPasswordValid(password!)
                              ? null
                              : "Enter Valid Password";
                        },
                        inputType: TextInputType.emailAddress,
                        obscureText: isHidden,
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        lableText: 'Password',
                        iconssuffix: InkWell(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    sizedBox,
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(right: 126, left: 126),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          snackbar('Logged In Succesfully', context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => snackbar(
                              'Redirect to Forgot Password Page', context),
                          child: Text(
                            "Forgot password?",
                            style: ktextstyle,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have account?",
                              style: ktextstyle,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  "Sign UP",
                                  style: ktextstyle.copyWith(
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
