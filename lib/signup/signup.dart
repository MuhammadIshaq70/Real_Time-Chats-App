import 'package:flutter/material.dart';
import 'package:flutter_chat/signup/signupViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SignUpViewModel>(
        builder: (context, Model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: zappbarcolor,
            title: const Center(
              child: Text('Login',
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
                    Row(
                      children: [
                        SizedBox(
                          height: 40.sp,
                          width: 180.sp,
                          child: TextFormField(
                              controller: Model.firstnameController,
                              decoration: const InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(color: Colors.grey)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter First Name';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        SizedBox(
                          width: 9.sp,
                        ),
                        SizedBox(
                          height: 40.sp,
                          width: 160.sp,
                          child: TextFormField(
                              controller: Model.lastnameController,
                              decoration: const InputDecoration(
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(color: Colors.grey)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Last Name';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Show full name on profile',
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
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
                          Model.Creataccount();
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
                    SizedBox(
                      height: 16.sp,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By signing up for a medical Dictionary  Community account , you \nare agreeing to our Terms of Service and Privacy Policy .',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    )
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
