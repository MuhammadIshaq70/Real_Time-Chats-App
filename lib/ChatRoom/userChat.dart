import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserChat extends StatefulWidget {
  String chatId;
  String? name;
  var Phone;
  var image;
  UserChat(
      {super.key,
      required this.chatId,
      required this.name,
      required this.Phone,
      required this.image});

  //final Map<String, dynamic>? userMap;

  //final String? chatRoomId;

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  TextEditingController controller = TextEditingController();

  final auth = FirebaseAuth.instance.currentUser;

  void addMessage() async {
    await FirebaseFirestore.instance
        .collection("Chat")
        .doc(widget.chatId)
        .collection("Message")
        .add({
      "text": controller.text.trim().toString(),
      "senderby": auth!.uid,
      "timee": "${DateTime.now().hour} : ${DateTime.now().minute}",
    });
    controller.clear();
    // message.insert(
    //     0,
    //     Messsage1(
    // text: controller.text.trim().toString(),
    // IsSentByMe: true,
    // timee: "${DateTime.now().hour} : ${DateTime.now().minute}"));

    // controller.clear();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.image.toString()),
                radius: 20,
                backgroundColor: Colors.cyanAccent.shade200,
              ),
              SizedBox(
                width: 9.sp,
              ),
              Column(
                children: [
                  Text(
                    widget.name.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.Phone,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 570,
                  width: double.infinity,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Chat")
                          .doc(widget.chatId)
                          .collection("Message")
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data!.docs[index];
                              bool isMe =
                                  data["senderby"] == auth!.uid ? true : false;

                              return Row(
                                mainAxisAlignment: isMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                         margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        constraints: const BoxConstraints(
                                            minHeight: 20, maxWidth: 200),
                                        decoration: BoxDecoration(
                                            color: isMe
                                                ? const Color.fromARGB(
                                                    255, 183, 255, 0)
                                                : const Color.fromARGB(
                                                    255, 31, 240, 248),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(data["text"]),
                                      ),
                                      Text(
                                        data["timee"],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 144, 164, 155)),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      })),
              Positioned(
                bottom: 20,
                right: 10,
                left: 10,
                //sstop: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 229, 81),
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                addMessage();
                              }
                            },
                            icon: const Icon(Icons.send)),
                        hintText: 'chat here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//Text('hello'),

// class Messsage1 {
//   String? text;
//   bool? IsSentByMe;
//   String? timee;
//   Messsage1({this.IsSentByMe, this.text, this.timee});
// }
//  ListView.builder(
//               itemCount: message.length,
//               itemBuilder: (context, index) {
//                 return message[index].IsSentByMe
//                     ? Padding(
//                         padding: const EdgeInsets.only(
//                             left: 260, bottom: 10, right: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Color.fromARGB(126, 21, 211, 113),
//                               border: Border.all(width: 3)),
//                           // constraints: BoxConstraints(maxWidth: 9),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('message[index].text.toString()'),
//                           ),
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(
//                             right: 260, bottom: 10, left: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.grey,
//                               border: Border.all(width: 2)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('message[index].text.toString()'),
//                           ),
//                         ),
//                       );
//               },
//             );
