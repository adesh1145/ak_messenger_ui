// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import '../../page/login_page/login.dart';
import '../../page/register_page/register_api_services.dart';
import '../../widget/app_icon_top_part.dart';
import '../../widget/colors.dart';
import '../../widget/elevatedbutton.dart';
import '../../widget/svgpicture.dart';
import '../../widget/text.dart';
import '../../widget/textformfield.dart';
import 'package:flutter/material.dart';

class RegisterPageUi extends StatefulWidget {
  const RegisterPageUi({super.key});

  @override
  State<RegisterPageUi> createState() => _RegisterPageUiState();
}

class _RegisterPageUiState extends State<RegisterPageUi> {
  final GlobalKey _numberFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool responseStatus = true;

  String errorData() {
    try {
      return responseData['error']['email'][0].toString();
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          TopPartOfScreen(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33 -
                MediaQuery.of(context).viewInsets.bottom * 0.75,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.67,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: gradientColor),
              child: Form(
                key: _numberFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWidget(
                      text: " Welcome !",
                      fontsize: 30,
                      textcolor: Colors.black,
                      fontweight: FontWeight.bold,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1.3,
                              color: Colors.blueGrey,
                            )),
                            TextWidget(
                              text: "  Register  ",
                              textcolor: Colors.grey,
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1.3,
                              color: Colors.blueGrey,
                            )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextWidget(
                            text: errorData(),
                            textcolor: Colors.red,
                            fontsize: 15,
                          ),
                        )
                      ],
                    ),
                    TextFieldWidget(
                      hint: "Enter Name",
                      label: Text("Name"),
                      prfixIcon: Icon(
                        Icons.person_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.name,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Name".toString();
                        }

                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Email",
                      label: Text("Email"),
                      prfixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email".toString();
                        } else if (!value.contains('@')) {
                          return "Please Enter @ ";
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Pasword",
                      label: Text("Pasword"),
                      obscureText: true,
                      prfixIcon: Icon(
                        Icons.password_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password".toString();
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Confirm Pasword",
                      label: Text("Confirm Pasword"),
                      obscureText: true,
                      prfixIcon: Icon(
                        Icons.password_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password".toString();
                        } else if (value != passwordController.text) {
                          return "Password Doesn't Match";
                        }
                        return null;
                      },
                    ),
                    ElevatedButtonWidget(
                      text: "Register",
                      borderRadius: 15,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      textcolor: Colors.white,
                      onpressed: () async {
                        name = "";
                        email = "";
                        password = "";
                        confirmPassword = "";

                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        confirmPassword = confirmPasswordController.text;

                        if (name != "" &&
                            email.contains('@') &&
                            password != "" &&
                            confirmPassword != "" &&
                            password == confirmPassword) {
                          setState(() {
                            responseStatus = false;
                          });

                          await fetchUser(context, email, name, password);
                          responseStatus = true;
                          setState(() {});
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButtonWidget(
                          text: "Log In",
                          fontsize: 15,
                          textcolor: blackColor,
                          onpressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInWithEmailPageUi(),
                                ));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (responseStatus == false)
            const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: true, color: Colors.black),
            ),
          if (responseStatus == false)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
