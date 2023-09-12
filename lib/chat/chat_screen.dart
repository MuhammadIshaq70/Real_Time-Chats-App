// import 'package:flutter/material.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xff171717),
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(
//                     left: 20,
//                     top: 20,
//                     right: 20,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.menu,
//                         color: Colors.white,
//                       ),
//                       Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 SizedBox(
//                   height: 40,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Messages',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 25,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Online',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 25,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Groups',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 25,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Others',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Positioned(
//                 top: 129,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 220,
//                   decoration: const BoxDecoration(
//                       color: Color(0xff27c1a9),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       )),
//                   child: Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(
//                           left: 20,
//                           top: 20,
//                           right: 20,
//                           bottom: 10,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Favorite Contact',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             Icon(
//                               Icons.search,
//                               color: Colors.white,
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 120,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('joy', 'download (1).jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('Marina', 'download (3).jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('alina', 'images.jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('ali', 'download.jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('bablo', 'images (3).jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             userFavorite('bock', 'images (3).jpg'),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const Column(
//                               children: [
//                                 UserAvatar(
//                                   fileName: 'download (3).jpg',
//                                 ),
//                                 Text('Alina',
//                                     style: TextStyle(color: Colors.white))
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//             Positioned(
//               top: 300,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     )),
//                 child: ListView(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //     builder: (context) => UserChat()));
//                       },
//                       child: BuildConversationRow('download.jpg', 'joy',
//                           'Helo Dear, How Are you', 12, '6:56'),
//                     ),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow(
//                         'download (3).jpg', 'Marina', 'hello', 0, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow('download.jpg', 'joy',
//                         'Helo Dear, How Are you', 0, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow('download (1).jpg', 'joy',
//                         'Helo Dear, How Are you', 2, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow(
//                         'images (3).jpg', 'joy', 'Welcome', 4, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow('images (3).jpg', 'joy',
//                         'Helo Dear, How Are you', 1, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow('download.jpg', 'joy',
//                         'Helo Dear, How Are you', 8, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow('download.jpg', 'joy',
//                         'Helo Dear, How Are you', 3, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     ),
//                     BuildConversationRow(
//                         'download.jpg', 'joy', 'Hi', 1, '6:56'),
//                     const Divider(
//                       indent: 50,
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Column BuildConversationRow(
//       String Filename, String name, String Message, int Count, String time) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 UserAvatar(fileName: Filename),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(color: Colors.black, fontSize: 13),
//                     ),
//                     const SizedBox(
//                       height: 0,
//                     ),
//                     Text(
//                       Message,
//                       style: const TextStyle(color: Colors.black, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     time,
//                     style: const TextStyle(color: Colors.black, fontSize: 13),
//                   ),
//                   const SizedBox(
//                     height: 1,
//                   ),
//                   if (Count > 0)
//                     CircleAvatar(
//                       radius: 9,
//                       backgroundColor: const Color(0xff27c1ab),
//                       child: Text(Count.toString(),
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 12)),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Column userFavorite(String name, String filename) {
//     return Column(
//       children: [
//         UserAvatar(
//           fileName: filename,
//         ),
//         Text(name, style: const TextStyle(color: Colors.white))
//       ],
//     );
//   }
// }

// class UserAvatar extends StatelessWidget {
//   final String fileName;
//   const UserAvatar({
//     super.key,
//     required this.fileName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 35,
//       backgroundColor: Colors.white,
//       child: CircleAvatar(
//         radius: 30,
//         backgroundImage: AssetImage('assets/images/$fileName'),
//       ),
//     );
//   }
// }
