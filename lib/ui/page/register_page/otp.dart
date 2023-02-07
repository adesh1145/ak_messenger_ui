// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, no_logic_in_create_state

import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/elevatedbutton.dart';
import 'package:ak_messenger/ui/widget/svgpicture.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:ak_messenger/ui/widget/textformfield.dart';
import 'package:flutter/material.dart';

class OtpPageUi extends StatefulWidget {
  const OtpPageUi({super.key, required this.number, required this.email});
  final String number;
  final String email;
  @override
  State<OtpPageUi> createState() => _OtpPageUiState(number, email);
}

class _OtpPageUiState extends State<OtpPageUi> {
  _OtpPageUiState(this.number, this.email);
  final GlobalKey _otpFormKey = GlobalKey<FormState>();
  final numberOtpController = TextEditingController();
  final emailOtpController = TextEditingController();

  String numberOtp = "";
  String emailOtp = "";
  bool numberOtpValid = true;
  bool emailOtpValid = true;
  final String number;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: blueColor7,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPictureWidget(
                    path: "assets/icon/chat.svg",
                    height: 125,
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: " AK Messenger",
                    fontsize: 30,
                    textcolor: Colors.white,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
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
                key: _otpFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: " Welcome !",
                      fontsize: 30,
                      textcolor: Colors.black,
                      fontweight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1.3,
                          color: Colors.blueGrey,
                        )),
                        TextWidget(
                          text: "  OTP  ",
                          textcolor: Colors.grey,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.3,
                          color: Colors.blueGrey,
                        )),
                      ],
                    ),

  // --------------NUmber OTP-------------
                    numberOtpValid == false
                        ? TextWidget(
                            text: "Invalid OTP",
                            textcolor: Colors.red,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              TextWidget(
                                text: "OTP has been Sent $number",
                                textcolor: Colors.green,
                              )
                            ],
                          ),
                    TextFieldWidget(
                      hint: "Enter Number OTP",
                      label: Text("Number OTP"),
                      prfixIcon: Icon(Icons.password_rounded),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.number,
                      controller: numberOtpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Number OTP".toString();
                        } else if (value.length < 6 || value.length > 6) {
                          return "Please Enter 6 Digit OTP";
                        }
                        return null;
                      },
                    ),
                  
                    emailOtpValid == false
                        ? TextWidget(
                            text: "Invalid OTP",
                            textcolor: Colors.red,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              TextWidget(
                                text: "OTP has been Sent $email",
                                textcolor: Colors.green,
                              )
                            ],
                          ),
                    TextFieldWidget(
                      hint: "Enter Email OTP",
                      label: Text("Email OTP"),
                      prfixIcon: Icon(Icons.password_rounded),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.number,
                      controller: emailOtpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter OTP".toString();
                        } else if (value.length < 6 || value.length > 6) {
                          return "Please Enter 6 Digit OTP";
                        }
                        return null;
                      },
                    ),
                    ElevatedButtonWidget(
                      text: "LogIn",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.06,
                      textcolor: Colors.white,
                      borderRadius: 15,
                      onpressed: () {
                        numberOtp = "";
                        emailOtp = "";
                        numberOtp = numberOtpController.text;
                        emailOtp = emailOtpController.text;
                        if (numberOtp.length!= 6) {
                          setState(() {
                            numberOtpValid = false;
                          });
                        } 
                        else if (numberOtp.length!= 6||emailOtp.length!=6) {
                          setState(() {
                            emailOtpValid = false;
                            
                          });
                        }
                        else{
                          setState(() {
                            numberOtpValid = true;
                          emailOtpValid = true;
                          });
                        }
                      },
                    ),
                    ElevatedButtonWidget(
                      text: "Resend OTP",
                      fontsize: 15,
                      textcolor: blueColor7,
                      onpressed: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
