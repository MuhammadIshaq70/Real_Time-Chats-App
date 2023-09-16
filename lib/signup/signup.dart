import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/signup/signupViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../login/login.dart';

import '../widget/CustomButton.dart';
import '../widget/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  XFile? _pickedImage;
  String? imageUrl;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
    uploadImageToFirebaseStorage(_pickedImage!.path);
  }

  //Image push in firebase

  Future<String> uploadImageToFirebaseStorage(String imagePath) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child("image/${DateTime.now().millisecondsSinceEpoch}");

    UploadTask uploadTask = storageReference.putFile(File(imagePath));

    await uploadTask.whenComplete(() => print('Image uploaded'));

    imageUrl = await storageReference.getDownloadURL();
    return imageUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SignUpViewModel>(
        builder: (context, Model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: zappbarcolor,
            title: const Center(
              child: Text('SignUp',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: Model.formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 24.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: zgreen1color,
                                borderRadius: BorderRadius.circular(9)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'M',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'D',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Create new account',
                          style: TextStyle(
                              fontSize: 28.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90.sp),
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          height: 150.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 195, 183, 183),
                              borderRadius: BorderRadius.circular(100)),
                          child: _pickedImage != null
                              ? CircleAvatar(
                                  radius: 75,
                                  backgroundImage:
                                      FileImage(File(_pickedImage!.path)),
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 80,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                        controller: Model.usernameController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'User Name',
                            suffixIcon: Icon(Icons.error_outline)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter User Name';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                        controller: Model.numberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Phone Num',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Phone Number';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: Model.emailnameController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: Model.passwordnameController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Password',
                            suffixIcon: Icon(Icons.visibility)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 32.sp,
                    ),
                    InkWell(
                      onTap: () {
                        if (Model.formKey.currentState!.validate()) {
                          Model.Creataccount(imageUrl.toString());
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            color1: zgreen1color,
                            text: 'CREATE ACCOUNT',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?'),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            ' Log in',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
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
