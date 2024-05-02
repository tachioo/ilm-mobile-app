import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/on_tap_tutor_profile.dart';
import 'package:flutter_testing/views/pages/subject.dart';
import 'package:flutter_testing/views/pages/TutorPages/tutor_card.dart';
import 'package:flutter_testing/views/services/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// import 'package:timeago/timeago.dart' as timeago;
final FirebaseAuth _auth = FirebaseAuth.instance;

class Image {
  String name;
  String imagePath;

  Image({required this.name, required this.imagePath});
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var currentUser = FirebaseAuth.instance.currentUser;
  Future getData() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
  }

  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  bool isDark = false;
  int currentPageIndex = 0;

  List<Image> students = [
    Image(name: "Guizhong", imagePath: 'assets/images/guizhong.jpg'),
    Image(name: "Seele", imagePath: 'assets/images/azki.jpeg'),
    Image(name: "Zhongli", imagePath: 'assets/images/makima.jpg'),
    Image(name: "Zhongli", imagePath: 'assets/images/saber.jpg'),
  ];

  List<Image> tutors = [
    Image(name: "Guizhong", imagePath: 'assets/images/guizhong.jpg'),
    Image(name: "Seele", imagePath: 'assets/images/makima.jpg'),
    Image(name: "Zhongli", imagePath: 'assets/images/saber.jpg'),
    Image(name: "Zhongli", imagePath: 'assets/images/azki.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMicrosecondsSinceEpoch(1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }
    // print(now.millisecondsSinceEpoch);

    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 10));

    print(now);

    return SafeArea(
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            body: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Some error occurred ${snapshot.error}'));
                  }

                  if (snapshot.hasData) {
                    DocumentSnapshot documentSnapshot = snapshot.data;
                    Map<String, dynamic>? data =
                        documentSnapshot.data() as Map<String, dynamic>;
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Align(
                                child: Text(
                              'Find Your Tutor',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )),
                          ),
                          // TextButton(
                          //     onPressed: signOut,
                          //     child: Icon(Icons.abc_outlined)),

                          // SEARCH BAR //
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SearchAnchor(builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                // to fix the keyboard not dismissing after clicking back arrow
                                focusNode: FocusNode(),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey.shade100),
                                controller: controller,
                                padding:
                                    const MaterialStatePropertyAll<EdgeInsets>(
                                        EdgeInsets.symmetric(horizontal: 16.0)),
                                onTap: () {
                                  controller.openView();
                                },
                                onChanged: (_) {
                                  controller.openView();
                                },
                                leading: const Icon(Icons.search),
                              );
                            }, suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
                              return List<ListTile>.generate(5, (int index) {
                                final String item = 'item $index';
                                return ListTile(
                                  title: Text(item),
                                  onTap: () {
                                    setState(() {
                                      controller.closeView(item);
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        FocusScope.of(context).unfocus();
                                      });
                                    });
                                  },
                                );
                              });
                            }),
                          ),
                          const Divider(
                            height: 30,
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )),
                          SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 140,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: students.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        SubjectContainer(
                                          name: students[index].name,
                                          imagePath: students[index].imagePath,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ),

                          //Tutor nearby Section

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tutor Nearby',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            height: 350,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: students.length,
                                itemBuilder: (context, index) {
                                  if (_auth.currentUser!.email ==
                                      data['email']) {
                                    return Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const OnTapTutorProfile()));
                                          },
                                          child: TutorCard(
                                            name: data['fullName'],
                                            imagePath:
                                                students[index].imagePath,
                                            city: data['city'],
                                            state: data['state'],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Text('ahyo');
                                  }
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          )),
    );
  }

//querying TutorCard
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      // print("the receiver uid is ${data['imageLink']}");
      return Container();
    } else {
      //return empty container
      return Container();
    }
  }
}
