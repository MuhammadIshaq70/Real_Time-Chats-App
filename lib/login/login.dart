import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../signup/signup.dart';
import '../widget/CustomButton.dart';
import '../widget/colors.dart';
import 'loginViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LoginViewModel>(
        builder: (context, Model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: zappbarcolor,
            title: const Center(
              child: Text('Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: Model.formKey,
                child: Column(
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
                          'Wellcome',
                          style: TextStyle(
                              fontSize: 32.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: Model.emailController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Email'),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: Model.passwordController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Password',
                          suffixIcon: Icon(
                            Icons.visibility,
                          )),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    InkWell(
                      onTap: () {
                        if (Model.formKey.currentState!.validate()) {
                          Model.interEmail();
                        }
                      },
                      child: CustomButton(
                        color1: zgreen1color,
                        text: 'Login',
                      ),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New to PINKSHOP?'),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                          },
                          child: const Text(
                            ' Create an Account',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
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
