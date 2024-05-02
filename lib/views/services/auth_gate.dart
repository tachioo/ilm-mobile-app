import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/homepage.dart';
import 'package:flutter_testing/views/pages/homepage_wrapper.dart';
import 'package:flutter_testing/views/pages/login_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            // DocumentSnapshot documentSnapshot = snapshot.data;

            //   Map<String, dynamic>? data =
            //       documentSnapshot.data() as Map<String, dynamic>;
            return HomepageWrapper(uid: snapshot.data!.uid);
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
