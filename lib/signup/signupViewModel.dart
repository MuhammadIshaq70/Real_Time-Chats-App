import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/users.dart';
import 'package:get/get.dart';

//import '../login/login.dart';
import '../widget/Utils.dart';

class SignUpViewModel extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailnameController = TextEditingController();
  TextEditingController passwordnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Creataccount(String imageurl) {
    _auth
        .createUserWithEmailAndPassword(
          email: emailnameController.text,
          password: passwordnameController.text,
        )
        .then((value) async {})
        .then((value) async {
      Utils().toastMessage('Successfully');
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set({
        "name": usernameController.text.trim().toString(),
        'phone': numberController.text.toString(),
        "id": _auth.currentUser!.uid,
        "email": emailnameController.text.trim().toString(),
        'imageUrl': imageurl
      });
      Get.to(() => const UserScreen());
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }
}
