import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_homepage.dart';
import 'package:flutter_testing/views/pages/homepage.dart';
import 'package:flutter_testing/views/pages/homepage_navigator.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomepageWrapper extends StatefulWidget {
  final String uid;
  HomepageWrapper({super.key, required this.uid});

  @override
  State<HomepageWrapper> createState() => _HomepageWrapperState();
}

class _HomepageWrapperState extends State<HomepageWrapper> {
  var currentUser = FirebaseAuth.instance.currentUser;
  Future getData() async {
    return FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              DocumentSnapshot documentSnapshot = snapshot.data;
              Map<String, dynamic>? data =
                  documentSnapshot.data() as Map<String, dynamic>;
              print("your student role is ${data['isStudent']}");
              print("your tutor role is ${data['isTutor']}");

              if (data['isTutor'] == true && data['isStudent'] == true) {
                return HomepageNavigator();
              } else if (data['isStudent'] == true) {
                return const HomePage();
              } else {
                return const TutorHomepage();
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
