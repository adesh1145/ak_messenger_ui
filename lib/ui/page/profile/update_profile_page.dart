// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/elevatedbutton.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:ak_messenger/ui/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePageUi extends StatefulWidget {
  const UpdateProfilePageUi({super.key});

  @override
  State<UpdateProfilePageUi> createState() => _UpdateProfilePageUi();
}

class _UpdateProfilePageUi extends State<UpdateProfilePageUi> {
  final GlobalKey _updatePageFormKey = GlobalKey<FormState>();

  final GlobalKey _passwordKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: "Adesh Yadav");

  final descriptionController = TextEditingController(text: "Every things is possible with money.");

  String name = "";

  String description = "";
  File? img;

  imageSelector() async {
    var img1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img1 == null) return;
    img = File(img1.path);
    setState(() {});
  }

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
                padding: EdgeInsets.only(top: 15),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(0))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.06,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: img != null
                                ? FileImage(img!)
                                : AssetImage('assets/images/client.png')
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: gradientColor2,
                                ),
                               child: IconButton(onPressed: (){
                                 imageSelector();
                               },
                                icon: Icon( Icons.photo_camera, ),
                                color: Colors.white,
                                iconSize: 30,),
                              ),
                              
                          )
                        ]),
                      ),
                      IconButton(
                        onPressed: () {
                         
                        },
                        icon: Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),
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
                  // color: Colors.white,
                  gradient: gradientColor),
              child: Form(
                key: _updatePageFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1.3,
                            color: Colors.blueGrey,
                          )),
                          TextWidget(
                            text: "    Update Profile    ",
                            textcolor: Colors.grey,
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1.3,
                            color: Colors.blueGrey,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        hint: "Enter Name",
                        label: Text("Name"),
                        prfixIcon: Icon(
                          Icons.mode_edit_outline_outlined,
                        ),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                        textInputType: TextInputType.emailAddress,
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        key: _passwordKey,
                        hint: "Descripton",
                        label: Text("Descripton"),
                        prfixIcon: Icon(
                          Icons.description_outlined,
                        ),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                        textInputType: TextInputType.visiblePassword,
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Descripton".toString();
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButtonWidget(
                        text: "Update",
                        textcolor: Colors.white,
                        borderRadius: 15,
                        width: 100,
                        height: MediaQuery.of(context).size.height * 0.06,
                        onpressed: () {
                          setState(() {
                            name = "";
                            description = "";
                            name = nameController.text;
                            description = descriptionController.text;
                            if (description != "" && name != "") {
                              setState(() {});
                            }
                          });
                        },
                      ),
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
