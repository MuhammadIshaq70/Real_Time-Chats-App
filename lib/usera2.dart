import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/userchat2.dart';
import 'package:get/get.dart';

class Users2 extends StatefulWidget {
  const Users2({super.key});

  @override
  State<Users2> createState() => _Users2State();
}

class _Users2State extends State<Users2> {
  getChatroomId(String id1, String id2) {
    if (id1.compareTo(id2) > 0) {
      return "${id2}_$id1";
    } else {
      return "${id1}_$id2";
    }
  }

  void chatroom2(String name, String id) async {
    final chatroomId2 = getChatroomId(auth!.uid, id);

    await FirebaseFirestore.instance
        .collection("chat12")
        .doc(chatroomId2)
        .get()
        .then((value) {
      if (value.exists) {
        Get.to(UserChat2(chatid: chatroomId2));
      } else {
        FirebaseFirestore.instance.collection('chat12').doc(chatroomId2).set({
          "users": [auth!.uid, id],
          "user1": auth!.uid,
          "user2": id,
          "chatroomid2": chatroomId2,
          "time": DateTime.now(),
          "LastMessage": ''
        });
        Get.to(UserChat2(
          chatid: chatroomId2,
        ));
      }
    });
  }

  final auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("id", isNotEqualTo: auth!.uid.toString())
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Placeholder();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    final data = snapshot.data!.docs[Index];
                    return Card(
                      color: const Color.fromARGB(255, 79, 228, 241),
                      elevation: 3,
                      child: ListTile(
                        onTap: () {
                          chatroom2(data['name'], data['id']);
                        },
                        leading: Text(data['name'].toString()),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
