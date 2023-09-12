import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/chat/chat_screen.dart';
import 'package:flutter_chat/users.dart';
import 'package:get/get.dart';

import '../widget/Utils.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  interEmail() {
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      Get.to(() => const UserScreen());
    }).then((value) {
      Utils().toastMessage('Successfully');
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }
}
