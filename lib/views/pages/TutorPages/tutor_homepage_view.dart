import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing/views/pages/TutorPages/session_page_view.dart';
import 'package:flutter_testing/views/pages/TutorPages/upcoming_class_card.dart';

class UpcomingClassCard {
  String title;

  UpcomingClassCard({required this.title});
}

class TutorHomepageView extends StatefulWidget {
  const TutorHomepageView({super.key, required bool isNewAccount});

  @override
  State<TutorHomepageView> createState() => _TutorHomepageViewState();
}

class _TutorHomepageViewState extends State<TutorHomepageView> {
  bool isNewAccount = true;
  List<UpcomingClassCard> cards = [
    UpcomingClassCard(
      title: "Today (1)",
    ),
    UpcomingClassCard(title: "This Week (1)"),
    UpcomingClassCard(
      title: "New Week (3)",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    UpcomingClassCard card = cards[0];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Welcome Back, Faris',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SessionPageView()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Complete your Session',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Upcoming class...',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                      itemCount: cards.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return UpcomingClass(
                          name: cards[index].title,
                        );
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Science',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'First Session',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 500,
                        child: Column(children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: 19,
                                itemBuilder: (context, index) {
                                  return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '4.00PM - 6.00PM',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.people_alt_outlined,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '3 Seats available',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.cast,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Online',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '4.00PM - 6.00PM',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade400),
                                              )
                                            ],
                                          ),
                                        ],
                                      ));
                                }),
                          ),
                        ]),
                      ),
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
