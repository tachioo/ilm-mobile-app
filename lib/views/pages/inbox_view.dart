import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/chat_container.dart';
import 'package:flutter_testing/views/pages/chat_view.dart';

// class InboxView extends StatefulWidget {
//   const InboxView({super.key});

//   @override
//   State<InboxView> createState() => _InboxViewState();
// }

// class _InboxViewState extends State<InboxView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Padding(
//           padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
//           child: Text(
//             'Inbox',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 36,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 20),
//           height: 600,
//           child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return const Column(
//                   children: [
//                     ChatContainer(),
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
// instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox View'),
      ),
      body: _buildUserList(),
    );
  }

// build a list of users except for the current logged in user (you)
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading...');
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  //build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      // print("the receiver uid is ${data['imageLink']}");
      return ListTile(
        title:
            data['fullName'] == null ? const Text('') : Text(data['fullName']),
        onTap: () {
          //pass the clicked user's UID to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatView(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
                receiverPfp: data['imageLink'],
                receiverName: data['fullName'],
                receiverLogoutTime: data['logoutTime'],
              ),
            ),
          );
        },
      );
    } else {
      //return empty container
      return Container();
    }
  }
}
