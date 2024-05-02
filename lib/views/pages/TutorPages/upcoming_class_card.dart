import 'package:flutter/material.dart';

class UpcomingClass extends StatelessWidget {
  final Object name;
  const UpcomingClass({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              '$name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )));
  }
}
