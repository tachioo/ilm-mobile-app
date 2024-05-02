import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectPriceModal extends StatefulWidget {
  const SubjectPriceModal({super.key});

  @override
  State<SubjectPriceModal> createState() => _SubjectPriceModalState();
}

class _SubjectPriceModalState extends State<SubjectPriceModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel_presentation)),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Edit Your Price',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
              const Text('            ')
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
                  'Your pricing will determine your worth.',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40)
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
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
