import 'package:flutter/material.dart';

class UserChat2 extends StatefulWidget {
  String chatid;
  UserChat2({super.key, required this.chatid});

  @override
  State<UserChat2> createState() => _UserChat2State();
}

class _UserChat2State extends State<UserChat2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ali Khan\n 03367070421'),
      ),
      body: const Column(
        children: [Placeholder()],
      ),
    );
  }
}
