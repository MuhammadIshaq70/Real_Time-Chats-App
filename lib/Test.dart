import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int age = 0;
  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Islogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
          backgroundColor: Colors.deepPurpleAccent.shade200,
        ),
        body: Column(
          children: [
            //const Text('heelo dear '),
            Text(age.toString()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setInt('age', 223344);
            sp.setBool('isLogin', false);
            setState(() {});
          },
          child: const Icon(Icons.ac_unit_sharp),
        ),
      ),
    );
  }

  Islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    age = sp.getInt('age') ?? 0;
    isLogin = sp.getBool('isLogin') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>isLogin?HomeScre():Login));
    });
  }
}
