import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/receipts.dart';

class Student {
  String name;
  String rollno;

  Student({required this.name, required this.rollno});
}

// ignore: must_be_immutable
class ReceiptsPage extends StatelessWidget {
  ReceiptsPage({super.key});

  List<Student> students = [
    Student(name: "To John", rollno: 'Payment Successful'),
    Student(name: "To Max", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
    Student(name: "To Max **********", rollno: 'Payment Successful'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Receipts",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            child: const Divider(
              color: Colors.transparent,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Receipt(
                    desc: students[index].rollno,
                    name: students[index].name,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
