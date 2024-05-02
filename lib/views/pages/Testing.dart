import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:flutter_testing/views/pages/Testing.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_homepage.dart';
import 'package:flutter_testing/views/pages/edit_profile_page.dart';
import 'package:flutter_testing/views/pages/personal_information_page.dart';
import 'package:flutter_testing/views/pages/receipts_page.dart';
import 'package:flutter_testing/views/pages/utils.dart';
import 'package:flutter_testing/views/services/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Student {
  String name;
  String rollno;

  Student({required this.name, required this.rollno});
}

// ignore: must_be_immutable
class TestingPage extends StatefulWidget {
  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  Uint8List? _image;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('heh'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(
                  hintText: 'Enter Bio',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save Profile'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Column(children: [
//                               const Divider(),
//                               const SizedBox(height: 20),
//                               // Container(
//                               //   width: 200.0,
//                               //   height: 200.0,
//                               //   decoration: BoxDecoration(
//                               //     color: const Color(0xff7c94b6),
//                               //     image: const DecorationImage(
//                               //       image: AssetImage('assets/images/guizhong.jpg'),
//                               //       fit: BoxFit.cover,
//                               //     ),
//                               //     borderRadius:
//                               //         const BorderRadius.all(Radius.circular(100.0)),
//                               //     border: Border.all(
//                               //       color: Colors.grey,
//                               //       width: 3.0,
//                               //     ),
//                               //   ),
//                               // ),
//                               GestureDetector(
//                                 // onTap: () async {
//                                 //   ImagePicker imagePicker = ImagePicker();
//                                 //   XFile? file =
//                                 //       await imagePicker.pickImage(source: ImageSource.gallery);
//                                 //   print('File path is ${file?.path}');
//                                 // },
//                                 child: Stack(
//                                   children: [
//                                     _image != null
//                                         ? Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(84)),
//                                                 border: Border.all(
//                                                     width: 3,
//                                                     color: Colors.grey)),
//                                             child: CircleAvatar(
//                                               radius: 80,
//                                               backgroundImage:
//                                                   MemoryImage(_image!),
//                                             ),
//                                           )
//                                         : Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(84)),
//                                                 border: Border.all(
//                                                     width: 3,
//                                                     color: Colors.transparent)),
//                                             child: const CircleAvatar(
//                                               radius: 80,
//                                               backgroundImage: AssetImage(
//                                                   'assets/images/profilePic.png'),
//                                             ),
//                                           ),
//                                     Positioned(
//                                         right: 0,
//                                         bottom: 0,
//                                         child: IconButton(
//                                             onPressed: selectImage,
//                                             icon:
//                                                 const Icon(Icons.add_a_photo)))
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 30),
//                               const Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Your Profile',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 26),
//                                 ),
//                               ),
//                               const Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'The information you share will be used across the apps to help others get to know you.',
//                                   style: TextStyle(
//                                     color: Color(0xFF404145),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               TextButton(
//                                   onPressed: getData,
//                                   //  () {
//                                   //   showModalBottomSheet(
//                                   //       shape: RoundedRectangleBorder(
//                                   //         borderRadius: BorderRadius.circular(20.0),
//                                   //       ),
//                                   //       context: context,
//                                   //       isScrollControlled: true,
//                                   //       builder: (context) => const EditSchoolModal());
//                                   // },
//                                   child: const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.school_outlined,
//                                             size: 30,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text(
//                                             'Where I went to school',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 16),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   )),
//                               const Divider(),
//                               TextButton(
//                                   onPressed: () {
//                                     showModalBottomSheet(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) =>
//                                             const EditLiveModal());
//                                   },
//                                   child: const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.location_on_outlined,
//                                             size: 30,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text(
//                                             'Where I live',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 16),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   )),
//                               const Divider(),
//                               TextButton(
//                                   onPressed: () {
//                                     showModalBottomSheet(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) =>
//                                             const LanguageDropdown());
//                                   },
//                                   child: const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.translate_outlined,
//                                             size: 30,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text(
//                                             'Language I speak',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 16),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   )),
//                               const Divider(),
//                             ]),
//                           ),
//                         ),

//                         //Button
//                         const Divider(height: 0),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           width: 200,
//                           child: TextButton(
//                             onPressed: () => Navigator.of(context).pop(),
//                             style: ButtonStyle(
//                               foregroundColor:
//                                   MaterialStateProperty.all(Colors.white),
//                               backgroundColor:
//                                   MaterialStateProperty.all(Colors.black),
//                               shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               )),
//                             ),
//                             child: const Text(
//                               'Done',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     );