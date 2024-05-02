import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:flutter_testing/views/pages/TutorPages/edit_tutor_profile_page.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_homepage.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_homepage_view.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_profile_page.dart';
import 'package:flutter_testing/views/pages/edit_profile_page.dart';
import 'package:flutter_testing/views/pages/personal_information_page.dart';
import 'package:flutter_testing/views/pages/receipts_page.dart';
import 'package:flutter_testing/views/pages/utils.dart';
import 'package:flutter_testing/views/services/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime? loginTime = null;
  DateTime? logoutTime = DateTime.now();

  void signOut() async {
    String? resp = await StoreData()
        .loggingOut(loginTime: loginTime, logoutTime: logoutTime);
  }

  var currentUser = FirebaseAuth.instance.currentUser;
  Future getData() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    print("logoutTime is ${logoutTime}");
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.cancel_presentation, color: Colors.black),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: const Text(
      //     'Edit Profile',
      //     style: TextStyle(fontWeight: FontWeight.w500),
      //   ),
      //   centerTitle: true,
      // ),
      body: FutureBuilder<dynamic>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Check error
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              //get the data

              DocumentSnapshot documentSnapshot = snapshot.data;
              Map<String, dynamic>? data =
                  documentSnapshot.data() as Map<String, dynamic>;
              // print("Image link is ${data['imageLink']}");

              void createTutorAcc() async {
                String resp = await StoreData().changeToTutor(isTutor: true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorHomepage()));
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    title: Center(
                        child: Column(
                      children: [
                        const Text(
                          'Setup your profile',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please setup your tutor profile to continue further.",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                    content: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditTutorProfilePage()));
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                )),
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    actions: const <Widget>[],
                  ),
                );
              }

              //Display the list
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 10, 50),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        data['imageLink'] != null
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      '${data['imageLink']}'),
                                ))
                            : Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.fill,
                                      'https://members-api.parliament.uk/api/Members/4210/Thumbnail'),
                                )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['fullName'] ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfile()))
                                .then((value) => setState(() {}));
                          },
                          child: const Text(
                            'Show Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 26),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PersonalInformationPage()))
                                  .then((value) => setState(() {}));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.account_box_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Personal Information',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.black,
                                )
                              ],
                            )),
                        const Divider(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReceiptsPage()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.receipt_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Receipts',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.black,
                                )
                              ],
                            )),
                        const Divider(),
                        TextButton(
                            onPressed: signOut,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Log out',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.black,
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                                onPressed: data['isTutor'] == false
                                    ? () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            title: Center(
                                                child: Column(
                                              children: [
                                                const Text(
                                                  'Change to Tutor',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "You have not created any Tutor account, create one now?",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        createTutorAcc();
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        )),
                                                      ),
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width: 120,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        )),
                                                      ),
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: const <Widget>[],
                                          ),
                                        )
                                    : () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            title: Center(
                                                child: Column(
                                              children: [
                                                const Text(
                                                  'Change to Tutor',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Do you want to change to your Tutor account now ?",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const TutorHomepage()));
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        )),
                                                      ),
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width: 120,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        )),
                                                      ),
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: const <Widget>[],
                                          ),
                                        ),
                                child: const Text(
                                  'Change to Tutor',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ))),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
