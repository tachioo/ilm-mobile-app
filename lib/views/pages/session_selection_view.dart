import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/TutorPages/edit_subject_view.dart';
import 'package:flutter_testing/views/pages/available_session_view.dart';

class Session {
  String name;
  String session;

  Session({required this.name, required this.session});
}

class SelectingSessionView extends StatefulWidget {
  const SelectingSessionView({super.key});

  @override
  State<SelectingSessionView> createState() => _SelectingSessionViewState();
}

class _SelectingSessionViewState extends State<SelectingSessionView> {
  // List<TextEditingController> _controllers = [];
  List<Session> sessionInfo = [
    Session(name: "To John", session: 'First Session'),
    Session(name: "To John", session: 'Second Session'),
  ];
  final birthDate = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    birthDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Science',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 700,
                  child: Column(children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: sessionInfo.length,
                          itemBuilder: (context, index) {
                            // _controllers.add(TextEditingController());

                            return AvailableSessionView(
                              session: sessionInfo[index].session,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

                    // TextFormField(
                    //   controller: birthDate,
                    //   readOnly: true,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Choose the Date',
                    //     prefixIcon: Align(
                    //       widthFactor: 1.0,
                    //       heightFactor: 1.0,
                    //       child: Icon(
                    //         Icons.calendar_month_outlined,
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: () async {
                    //     DateTime? picked = await showDatePicker(
                    //         context: context,
                    //         initialDate: selectedDate,
                    //         firstDate: DateTime(2015, 8),
                    //         lastDate: DateTime(2101));
                    //     if (picked != null && picked != selectedDate) {
                    //       setState(() {
                    //         birthDate.text =
                    //             DateFormat('yyyy-MM-dd').format(picked);
                    //       });
                    //     }
                    //   },
                    // ),