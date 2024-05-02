import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  final Object name;
  final Object imagePath;
  const SubjectContainer(
      {super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage('$imagePath'),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.grey,
              width: 3.0,
            ),
          ),
        ),
        Text(
          "$name",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
