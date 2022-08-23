import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../commons/my_formfield.dart';
import '../../commons/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidden = true;
  IconData icon = Icons.visibility;

  void keyboardDismissal() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      return currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: keyboardDismissal,
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
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.5,
                      child: Lottie.network(
                          "https://assets5.lottiefiles.com/private_files/lf30_x2lzmtdl.json"),
                    ),

                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30, right: 30),
                    //   child: EmailValidate(emailControl: emailController),
                    // ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: MyFormField(
                        len: 1,
                        inputType: TextInputType.emailAddress,
                        obscureText: isHidden,
                        controller: passwordController,
                        prefixIcon: Icons.mail_outline,
                        lableText: 'Password',
                        errormessage: 'Please enter Password',
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
                      height: size.height * 0.03,
                    ),
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
                      onPressed: () {},
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
                        Text(
                          "forgot password?",
                          style: ktextstyle,
                          textAlign: TextAlign.right,
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
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => SignUp(),
                                //   ),
                                // );
                              },
                              child: Text(
                                " Sign UP",
                                style: ktextstyle.copyWith(
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
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