import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/Testing.dart';
import 'package:flutter_testing/views/pages/TutorPages/create_session_view.dart';

class SessionPageView extends StatefulWidget {
  const SessionPageView({super.key});

  @override
  State<SessionPageView> createState() => _SessionPageViewState();
}

class _SessionPageViewState extends State<SessionPageView> {
  bool noData = false;
  @override
  Widget build(BuildContext context) {
    if (noData == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Session",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: Text(
                'You have not set your subject.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF404145)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: const Text(
                    'Setup subject',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Session",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Created subject',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 560,
                    child: Column(children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: 14,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateSessionView()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.subject_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Subject')
                                        ],
                                      ),
                                      Text('3 Sessions')
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ]),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Add Subject')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
