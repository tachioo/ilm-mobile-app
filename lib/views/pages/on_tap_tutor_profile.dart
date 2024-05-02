import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/TutorPages/modal/edit_work_modal.dart';
import 'package:flutter_testing/views/pages/TutorPages/modal/tutor_subject_dropdown.dart';
import 'package:flutter_testing/views/pages/edit_live_modal.dart';
import 'package:flutter_testing/views/pages/edit_school_modal.dart';
import 'package:flutter_testing/views/pages/schedule_view.dart';
import 'package:flutter_testing/views/pages/tutor_availability_view.dart';

class OnTapTutorProfile extends StatefulWidget {
  const OnTapTutorProfile({super.key});

  @override
  State<OnTapTutorProfile> createState() => _OnTapTutorProfileState();
}

class _OnTapTutorProfileState extends State<OnTapTutorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_presentation, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Nurul Hidayah (Tutor Profile)',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  const Divider(),
                  const SizedBox(height: 20),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/guizhong.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 3.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bio',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
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
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const TutorSubjectDropdown());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Choose what your tutoring (subject)',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
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
                            builder: (context) => const EditWorkModal());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Where I work',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
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
                            builder: (context) => const EditSchoolModal());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Where I went to school',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
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
                            builder: (context) => const EditLiveModal());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Where I live',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
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
                            builder: (context) => const TutorSubjectDropdown());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Language I speak',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
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
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(50)),
                  // ),
                  // title: const Column(
                  //   children: [Text('')],
                  // ),
                  content: SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 10, color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TutorAvailabilityView())),
                  actions: const <Widget>[
                    // TextButton(
                    //   onPressed: () => Navigator.pop(context, 'Cancel'),
                    //   child: const Text('Cancel'),
                    // ),
                    // TextButton(
                    //   onPressed: () => Navigator.pop(context, 'OK'),
                    //   child: const Text('OK'),
                    // ),
                  ],
                  insetPadding: const EdgeInsets.all(10),
                  backgroundColor: Colors.transparent,
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: const Text(
                'View Availability',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
