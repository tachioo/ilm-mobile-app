// import 'package:flutter/material.dart';
// import 'package:flutter_testing/views/pages/student_session_payment_view.dart';

// class ChatView extends StatefulWidget {
//   const ChatView({super.key});

//   @override
//   State<ChatView> createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   bool isSessionSelected = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Container(
//               width: 50.0,
//               height: 50.0,
//               decoration: BoxDecoration(
//                 color: const Color(0xff7c94b6),
//                 image: const DecorationImage(
//                   image: AssetImage('assets/images/guizhong.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: const BorderRadius.all(Radius.circular(50.0)),
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 2.0,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             const Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Nik Muhammad aaaaaaaaaaaaaaaaaaaaaaaaaa",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     'online',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(children: [
//         const SizedBox(
//           height: 20,
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           color: Colors.amber[100],
//                           borderRadius: BorderRadius.circular(10)),
//                       child: const Text('woi fffff'),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(12, 5, 12, 0),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '9.34PM',
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           color: const Color(0xFF5181DD),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: const Text(
//                         'woi fffffawdawdawdwdjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjddddddddddddddddddddddddddd',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(12, 5, 12, 0),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         '9.34PM',
//                         style: TextStyle(
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const Divider(),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Your Choice :',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '4 February, 7 February',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               TextButton(
//                 onPressed: isSessionSelected == true
//                     ? () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const StudentSessionPaymentView()));
//                       }
//                     : null,
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.disabled)) {
//                         return Colors.white;
//                       } else {
//                         return Colors.white;
//                       }
//                     },
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.disabled)) {
//                         return Colors.grey;
//                       } else {
//                         return Colors.black;
//                       }
//                     },
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   )),
//                 ),
//                 child: const Text(
//                   'Confirm',
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             children: [
//               Flexible(
//                 child: TextField(
//                   decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.grey.shade900)),
//                       hintText: 'Type here...',
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 10)),
//                 ),
//               ),
//               // const SizedBox(width: 5),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_upward_sharp),
//               ),
//               IconButton(
//                 splashRadius: 0.0001,
//                 padding: EdgeInsets.zero,
//                 onPressed: () {},
//                 icon: const Icon(Icons.camera_alt_outlined),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         )
//       ]),
//     );
//   }
// }

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing/components/chat_bubble.dart';
import 'package:flutter_testing/views/services/chat/chat_service.dart';
import 'package:intl/intl.dart';

class ChatView extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  final String receiverPfp;
  final String receiverName;
  final Timestamp? receiverLogoutTime;
  const ChatView({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
    required this.receiverPfp,
    required this.receiverName,
    required this.receiverLogoutTime,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void sendMessage() async {
    //only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);

      //clear the text controller after sending the message
      _messageController.clear();
      scrollToBottom();
    }
  }

  String lastSeen = '';
  getLastSeen() async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var logoutTime = widget.receiverLogoutTime!.millisecondsSinceEpoch;
    var timeDiff = currentTime - logoutTime;
    var minutes = (timeDiff / (1000 * 60)).floor();
    var hours = (minutes / 60).floor();
    var days = (hours / 24).floor();
    // print(currentTime);
    // print(logoutTime);
    // print(timeDiff);
    // print("${minutes} minutes");
    // print("${hours} hours");
    // print("${days} days");

    if (widget.receiverLogoutTime == null) {
      lastSeen = 'last seen just now';
    } else if (minutes < 1) {
      lastSeen = 'last seen just now';
    } else if (days > 0) {
      lastSeen = 'Last seen $days day${days > 1 ? 's' : ''} ago';
    } else if (hours > 0) {
      lastSeen = 'Last seen $hours hour${hours > 1 ? 's' : ''} ago';
    } else {
      lastSeen = 'Last seen $minutes minute${minutes > 1 ? 's' : ''} ago';
    }
  }

  @override
  void initState() {
    getLastSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // lastSeen = getLastSeen();

    // print(widget.receiverLogoutTime!.millisecondsSinceEpoch * 1000);
    // print('your imageLink is ${widget.receiverPfp}');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Container(
            //   width: 50.0,
            //   height: 50.0,
            //   decoration: BoxDecoration(
            //     color: const Color(0xff7c94b6),
            //     image: const DecorationImage(
            //       image: AssetImage('assets/images/guizhong.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            //     border: Border.all(
            //       color: Colors.grey,
            //       width: 2.0,
            //     ),
            //   ),
            // ),
            widget.receiverPfp != null
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                          widget.receiverPfp),
                    ))
                : Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                          height: 35,
                          width: 35,
                          fit: BoxFit.fill,
                          'https://members-api.parliament.uk/api/Members/609/Thumbnail'),
                    )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.receiverName,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  widget.receiverLogoutTime == null
                      ? const Text(
                          'online',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        )
                      : Text(
                          lastSeen,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // messages
          Expanded(
            child: _buildMessageList(),
          ),

          // user input
          _buildMessageInput(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        return ListView(
          controller: _scrollController,
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    Timestamp t = data['timestamp'] as Timestamp;
    DateTime currentDate = t.toDate();

    // final dateFormatter = DateFormat('yyyy-MM-dd');
    final timeFormatter = DateFormat('HH:mm a');
    final formattedTime = timeFormatter.format(currentDate.toLocal());

    // align the message to the right if the sender is the current user, otherwise to the left

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    var bubbleColor = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Colors.blue
        : Colors.amber;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            // Text(data['senderEmail']),
            // const SizedBox(
            //   height: 5,
            // ),
            ChatBubble(
              message: data['message'],
              bubbleClr: bubbleColor,
            ),
            // Text(data['timestamp'].toString()),
            Text(formattedTime),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // textfield
          Expanded(
            child: TextFormField(
              onTap: scrollToBottom,
              controller: _messageController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade900)),
                  hintText: 'Type here...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          // send button
          IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                size: 40,
              ))
        ],
      ),
    );
  }
}
