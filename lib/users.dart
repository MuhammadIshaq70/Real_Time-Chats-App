import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'ChatRoom/userChat.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final auth = FirebaseAuth.instance.currentUser;

  getChatroomId(String id1, String id2) {
    if (id1.compareTo(id2) > 0) {
      return "${id2}_$id1";
    } else {
      return "${id1}_$id2";
    }
  }

  void chatroom(String name, String id) async {
    print("My id:${auth!.uid}");
    print("other id:$id");
    String chatRoomId = getChatroomId(auth!.uid, id);

    await FirebaseFirestore.instance
        .collection("Chat")
        .doc(chatRoomId)
        .get()
        .then((value) async {
      if (value.exists) {
        Get.to(UserChat(
          chatId: chatRoomId,
        ));
        print("Alread exist");
      } else {
        await FirebaseFirestore.instance
            .collection("Chat")
            .doc(chatRoomId)
            .set({
          "users": [auth!.uid, id],
          "user1": auth!.uid,
          "user2": id,
          "chatRoomId": chatRoomId,
          "time": DateTime.now(),
          "lastMessage": "",
        });
        Get.to(UserChat(
          chatId: chatRoomId,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("id", isNotEqualTo: auth!.uid.toString())
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  return ListTile(
                    onTap: () {
                      chatroom(data["name"], data["id"]);
                    },
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fin.pinterest.com%2Fpin%2Fpinterest--748793875553180511%2F&psig=AOvVaw2Y6uEzEvEi4Kk1enWeyTZF&ust=1694581092320000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCJiDutOkpIEDFQAAAAAdAAAAABAJ'),
                    ),
                    title: Text(snapshot.data!.docs[index]["name"].toString()),
                    trailing:
                        Text(snapshot.data!.docs[index]["email"].toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
