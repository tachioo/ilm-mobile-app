import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:flutter_testing/views/pages/utils.dart';

class EditSchoolModal extends StatefulWidget {
  const EditSchoolModal({super.key});

  @override
  State<EditSchoolModal> createState() => _EditSchoolModalState();
}

class _EditSchoolModalState extends State<EditSchoolModal> {
  TextEditingController schoolController = TextEditingController();
  void saveProfile() async {
    String res = await StoreData()
        .saveSchool(schoolName: schoolController.text, location: '');
    // setState(() {});
    Navigator.of(context).pop();
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const EditProfile()));
  }

  var textCounter = '0';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel_presentation)),
              ),
              const SizedBox(
                width: 80,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(children: [
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Where did you go to school?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Whether it’s home school, secondary or tertiary,\nname the school that made you who you are.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: schoolController,
                        onChanged: (value) {
                          setState(() {
                            textCounter = value.length.toString();
                          });
                        },
                        textCapitalization: TextCapitalization.words,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(40),
                          UpperCaseTextFormatter()
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$textCounter/40 characters",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
        //When textpad appeared,the button didnt go up , need to use Scaffold,but scaffold cant change the border radius of the modal (use Expanded)
        //Button
        const Divider(
          height: 0,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                saveProfile();
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Processing Data')),
                // );
              }
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
        const SizedBox(height: 10)
      ],
    );
  }
}

// extension StringExtensions on String {
//   capitalize() async {
//     return await "${this.toUpperCase()}${this.substring(1)}";
//   }
// }
