// import 'package:flutter/material.dart';
// import 'package:flutter_testing/views/pages/TutorPages/modal/edit_work_modal.dart';
// import 'package:flutter_testing/views/pages/TutorPages/modal/tutor_subject_dropdown.dart';
// import 'package:flutter_testing/views/pages/edit_live_modal.dart';
// import 'package:flutter_testing/views/pages/edit_school_modal.dart';

// class EditTutorProfilePage extends StatefulWidget {
//   const EditTutorProfilePage({super.key});

//   @override
//   State<EditTutorProfilePage> createState() => _EditTutorProfilePageState();
// }

// class _EditTutorProfilePageState extends State<EditTutorProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.cancel_presentation, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Edit Profile (Tutor)',
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(children: [
//                   const Divider(),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: 200.0,
//                     height: 200.0,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff7c94b6),
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/guizhong.jpg'),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(100.0)),
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 3.0,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Your Profile',
//                       style:
//                           TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
//                     ),
//                   ),
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'The information you share will be used across the apps to help others get to know you.',
//                       style: TextStyle(
//                         color: Color(0xFF404145),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) => const TutorSubjectDropdown());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.cast,
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Choose what your tutoring (subject)',
//                                 style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               )
//                             ],
//                           ),
//                         ],
//                       )),
//                   const Divider(),
//                   TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) => const EditWorkModal());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.cases_outlined,
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Where I work',
//                                 style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               )
//                             ],
//                           ),
//                         ],
//                       )),
//                   const Divider(),
//                   TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) => const EditSchoolModal());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.school_outlined,
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Where I went to school',
//                                 style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               )
//                             ],
//                           ),
//                         ],
//                       )),
//                   const Divider(),
//                   TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) => const EditLiveModal());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.location_on_outlined,
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Where I live',
//                                 style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               )
//                             ],
//                           ),
//                         ],
//                       )),
//                   const Divider(),
//                   TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) => const TutorSubjectDropdown());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.translate_outlined,
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Language I speak',
//                                 style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )),
//                   const Divider(),
//                 ]),
//               ),
//             ),
//           ),

//           //Button
//           const Divider(height: 0),
//           const SizedBox(height: 10),
//           SizedBox(
//             width: 200,
//             child: TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//                 backgroundColor: MaterialStateProperty.all(Colors.black),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 )),
//               ),
//               child: const Text(
//                 'Done',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:flutter_testing/views/pages/TutorPages/modal/edit_work_modal.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutoring_subject_dropdown.dart';
import 'package:flutter_testing/views/pages/edit_live_modal.dart';
import 'package:flutter_testing/views/pages/edit_school_modal.dart';
import 'package:flutter_testing/views/pages/language_dropdown.dart';
import 'package:flutter_testing/views/pages/utils.dart';
import 'package:image_picker/image_picker.dart';

class EditTutorProfilePage extends StatefulWidget {
  const EditTutorProfilePage({super.key});

  @override
  State<EditTutorProfilePage> createState() => _EditTutorProfilePageState();
}

class _EditTutorProfilePageState extends State<EditTutorProfilePage> {
  Uint8List? _image;

  //select profile photo
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  // save user profile when clicked
  void saveProfile() async {
    String? resp = await StoreData().saveTutorData(file: _image!);
    setState(() {});
    // Navigator.of(context).pop(true);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const EditProfile()));
  }

  //sign user out
  // void signOut() {
  //   //get auth service
  //   final authService = Provider.of<AuthService>(context, listen: false);

  //   authService.signOut();
  // }

  String imageUrl = '';

  var currentUser = FirebaseAuth.instance.currentUser;

  // CollectionReference _collection =
  //     FirebaseFirestore.instance.collection('users');

  Future getData() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_presentation, color: Colors.black),
          onPressed: () => Navigator.pop(context, true),
        ),
        title: const Text(
          'Edit Profile (Tutor)',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
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
              print("Image link is ${data['imageLink']}");
              // QuerySnapshot querySnapshot = snapshot.data;
              // List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              //Convert the documents to Maps
              // List<Map> items = documents.map((e) => e.data() as Map).toList();
              // print(data['languages']);
              List<dynamic>? languages = data['languages'];

              //Display the list
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          const Divider(),
                          const SizedBox(height: 20),
                          GestureDetector(
                            // onTap: () async {
                            //   ImagePicker imagePicker = ImagePicker();
                            //   XFile? file =
                            //       await imagePicker.pickImage(source: ImageSource.gallery);
                            //   print('File path is ${file?.path}');
                            // },
                            child: Stack(
                              children: [
                                data['tutorImageLink'] != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.cover,
                                              '${data['tutorImageLink']}'),
                                        ))
                                    : Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.fill,
                                              'https://members-api.parliament.uk/api/Members/4210/Thumbnail'),
                                        )),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: IconButton(
                                        onPressed: selectImage,
                                        icon: const Icon(Icons.add_a_photo)))
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Your Profile',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 26),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'The information you share will be used across the apps to help others get to know you.',
                              style: TextStyle(
                                color: Color(0xFF404145),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        const TutoringSubjectDropdown()).then(
                                    (value) => setState(() {}));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cast,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Choose what your tutoring (subject)',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                              data['tutoringSubject'] != null
                                                  ? Text(
                                                      languages!.join(', '),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    )
                                                  : Container(),
                                            ]),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        const EditSchoolModal()).then(
                                    (value) => setState(() {}));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.school_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Where I went to school',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                            data['schoolName'] != null
                                                ? Text(
                                                    '${data['schoolName']}',
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16),
                                                  )
                                                : Container(),
                                          ])
                                    ],
                                  ),
                                ],
                              )),
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        const EditWorkModal()).then(
                                    (value) => setState(() {}));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cases_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Where I Work',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                            data['workLocation'] != null
                                                ? Text(
                                                    '${data['workLocation']}',
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16),
                                                  )
                                                : Container(),
                                          ])
                                    ],
                                  ),
                                ],
                              )),
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        const EditLiveModal());
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Where I live',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        const LanguageDropdown()).then(
                                    (value) => setState(() {}));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.translate_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Language I speak',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                              data['languages'] != null
                                                  ? Text(
                                                      languages!.join(', '),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    )
                                                  : Container(),
                                            ]),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          const Divider(),
                        ]),
                      ),
                    ),
                  ),

                  //Button
                  const Divider(height: 0),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: saveProfile,
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
