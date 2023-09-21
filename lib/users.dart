import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'ChatRoom/userChat.dart';
import 'Services/Notification_Services.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    SendNotifiation.calling(context);
    super.initState();
  }

  final auth = FirebaseAuth.instance.currentUser;

  getChatroomId(String id1, String id2) {
    if (id1.compareTo(id2) > 0) {
      return "${id2}_$id1";
    } else {
      return "${id1}_$id2";
    }
  }

  void chatroom(
      String name, String id, var phone, var image1, var Token) async {
    // print("My id:${auth!.uid}");
    // print("other id:$id");
    String chatRoomId = getChatroomId(auth!.uid, id);

    await FirebaseFirestore.instance
        .collection("Chat")
        .doc(chatRoomId)
        .get()
        .then((value) async {
      if (value.exists) {
        Get.to(UserChat(
          chatId: chatRoomId,
          name: name,
          Phone: phone,
          image: image1,
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
          name: name,
          Phone: phone,
          image: image1,
          Token: Token,
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
                      chatroom(data["name"], data["id"], data["phone"],
                          data['imageUrl'], data['token']);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data!.docs[index]["imageUrl"].toString()),
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
