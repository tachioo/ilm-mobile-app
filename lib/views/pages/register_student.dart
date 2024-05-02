import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing/views/pages/homepage.dart';
import 'package:flutter_testing/views/services/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: RegisterStudent(),
//   ));
// }
const List<String> list = <String>['Male', 'Female'];

class AuthGateStudent extends StatelessWidget {
  const AuthGateStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return RegisterStudent();
          }
        },
      ),
    );
  }
}

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({super.key});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  // text controllers
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumController = TextEditingController();
  final idenCardController = TextEditingController();
  final genderController = TextEditingController();
  final birthDateController = TextEditingController();
  final poscodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final addressFirstLineController = TextEditingController();
  final addressSecondLineController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final birthDate = TextEditingController();
  String dropdownValue = list.first;

  // sign up user
  void signUp() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match !'),
        ),
      );
      return;
    }

    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    String imageLink = "";
    try {
      await authService.signUpWithEmailandPassword(
        // ignore: prefer_interpolation_to_compose_strings
        firstNameController.text,
        lastNameController.text,
        (firstNameController.text + " " + lastNameController.text),
        emailController.text,
        passwordController.text,
        phoneNumController.text,
        idenCardController.text,
        // genderController.text,
        dropdownValue,
        birthDate.text,
        imageLink,
        true,
        false,
        poscodeController.text,
        cityController.text,
        stateController.text,
        addressFirstLineController.text,
        addressSecondLineController.text,
        // ignore: prefer_interpolation_to_compose_strings
        (addressFirstLineController.text +
            ", " +
            addressSecondLineController.text +
            ', ' +
            poscodeController.text +
            ", " +
            cityController.text +
            ', ' +
            stateController.text),
        DateTime.now(),
        null,
      );
      // to clear the modal after signing up and then log out, need better ways to handle this
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       e.toString(),
      //     ),
      //   ),
      // );
    }
  }

  // void testing() async {
  //   // Validate returns true if the form is valid, or false otherwise.
  //   if (_formKey.currentState!.validate()) {
  //     // If the form is valid, display a snackbar. In the real world,
  //     // you'd often call a server or save the information in a database.
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Processing Data')),
  //     );
  //   }
  //   return;
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    birthDate.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(dropdownValue);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Personal Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Provide your personal info',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Last Name',
                  ),
                ),
                // const SizedBox(height: 10),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: phoneNumController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: idenCardController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your identification card';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Identification Card',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // TextFormField(
                //   controller: genderController,
                //   decoration: const InputDecoration(
                //     border: UnderlineInputBorder(),
                //     labelText: 'Gender',
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownMenu<String>(
                          width: 200,
                          initialSelection: list.first,
                          onSelected: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
                //
                TextFormField(
                  controller: birthDate,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birth date';
                    }
                    return null;
                  },
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
                        birthDate.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: poscodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your poscode';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Poscode',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'State',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addressFirstLineController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address line 1';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Address Line 1',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addressSecondLineController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address line 2';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Address Line 2',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextButton(
                    onPressed: signUp,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
