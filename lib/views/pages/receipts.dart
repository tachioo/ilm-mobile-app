import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/receipt_details_page.dart';

class Receipt extends StatelessWidget {
  final Object name;
  final Object desc;
  const Receipt({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReceiptDetailsPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(Icons.money_outlined),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "$desc",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$name',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        const Divider()
      ],
    );
  }
}
