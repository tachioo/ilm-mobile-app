import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditLiveModal extends StatefulWidget {
  const EditLiveModal({super.key});

  @override
  State<EditLiveModal> createState() => _EditLiveModalState();
}

class _EditLiveModalState extends State<EditLiveModal> {
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
                  'Where are you living ?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'nok tulih nate po sini woi',
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
                        onChanged: (value) {
                          setState(() {
                            textCounter = value.length.toString();
                          });
                        },
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
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
        //When textpad appeared,the button didnt go up , need to use Scaffold,but scaffold cant change the border radius of the modal
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
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Navigator.pop(context);
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
