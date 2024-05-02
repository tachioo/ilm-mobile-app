import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:intl/intl.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  // final emailController = TextEditingController();
  // final phoneNumController = TextEditingController();
  // final idenCardController = TextEditingController();
  // final genderController = TextEditingController();
  // final addressController = TextEditingController();

  final birthDate = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    birthDate.dispose();
    super.dispose();
  }

  var currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference _collection =
      FirebaseFirestore.instance.collection('users');

  Future getData() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
  }

  // save user info when clicked
  // void saveInfo() async {
  //   print('you clicked');
  //   String resp = await StoreData().saveUserInfo(
  //       firstName: firstNameController.text,
  //       lastName: lastNameController.text,
  //       email: emailController.text,
  //       phoneNum: phoneNumController.text,
  //       idenCard: idenCardController.text,
  //       gender: genderController.text,
  //       birthDate: birthDate.text,
  //       address: addressController.text);
  //   // setState(() {});s
  //   // Navigator.of(context).pop(true);
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: (context) => const EditProfile()));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit Personal Info'),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          //     child: TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         'Save',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             decoration: TextDecoration.underline,
          //             color: Colors.black),
          //       ),
          //     ),
          //   ),
          // ],
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

                //Display the list

                final firstNameController =
                    TextEditingController(text: data['firstName']);
                final lastNameController =
                    TextEditingController(text: data['lastName']);
                final emailController =
                    TextEditingController(text: data['email']);
                final phoneNumController =
                    TextEditingController(text: data['phoneNum']);
                final idenCardController =
                    TextEditingController(text: data['identificationCard']);
                final genderController =
                    TextEditingController(text: data['gender']);
                final birthDateController =
                    TextEditingController(text: data['birthDate']);
                final addressController =
                    TextEditingController(text: data['address']);
                // final birthDate = TextEditingController(text: data['birthDate']);

                void saveInfo() async {
                  print('you clicked');
                  String resp = await StoreData().saveUserInfo(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      fullName:
                          "${firstNameController.text} ${lastNameController.text}",
                      email: emailController.text,
                      phoneNum: phoneNumController.text,
                      idenCard: idenCardController.text,
                      gender: genderController.text,
                      birthDate: birthDateController.text,
                      address: addressController.text);
                  setState(() {});
                  // Navigator.of(context).pop(true);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => const EditProfile()));
                }

                return Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // const Text(
                            //   'Edit Personal Info ',
                            //   style: TextStyle(
                            //       fontSize: 26, fontWeight: FontWeight.w500),
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: firstNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: lastNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name',
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            TextFormField(
                              controller: phoneNumController,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                              ),
                            ),
                            TextFormField(
                              controller: idenCardController,
                              decoration: const InputDecoration(
                                labelText: 'Identification Card',
                              ),
                            ),
                            TextFormField(
                              controller: genderController,
                              decoration: const InputDecoration(
                                labelText: 'Gender',
                              ),
                            ),
                            TextFormField(
                              controller: birthDateController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                border: UnderlineInputBorder(),
                                labelText: 'Birth date',
                              ),
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(2015, 8),
                                    lastDate: DateTime(2101));
                                if (picked != null && picked != selectedDate) {
                                  setState(() {
                                    birthDateController.text =
                                        DateFormat('yyyy-MM-dd').format(picked);
                                    print(birthDateController.text);
                                  });
                                }
                              },
                            ),
                            TextFormField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Button
                  // const Divider(height: 0),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: saveInfo,
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
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ]);
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
