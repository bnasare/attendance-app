import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:knust_coc/classattendees.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AttendeesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttendeesPage extends StatefulWidget {
  const AttendeesPage({Key? key}) : super(key: key);

  @override
  _AttendeesPageState createState() => _AttendeesPageState();
}

class _AttendeesPageState extends State<AttendeesPage> {
  final CollectionReference attendanceCollection = FirebaseFirestore.instance.collection('attendance');

  int _checkedCount = 0;
  List<Attendee> filteredAttendees = [];
  String searchQuery = '';
  @override
  void initState() {
    super.initState();
    setState(() {
      filteredAttendees = attendees;
    });
  }

  void filterAttendees(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredAttendees = attendees;
      } else {
        filteredAttendees = attendees
            .where((attendee) =>
                attendee.name.toLowerCase().contains(query.toLowerCase()) ||
                attendee.status.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Add the list of attendees here
  final List<Attendee> attendees = [
    Attendee(
      id: 1,
      name: 'John Doe',
      description: '400',
      status: 'Republic Hall(B)',
      checked: false,
    ),
    Attendee(
      id: 2,
      name: 'Jane Doe',
      description: '500',
      status: 'Independence Hostel',
      checked: false,
    ),
    Attendee(
      id: 3,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 4,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 5,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 6,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 7,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 8,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
    Attendee(
      id: 9,
      name: 'Bob Smith',
      description: '300',
      status: 'Sahara Hostel',
      checked: false,
    ),
  ];

  

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Attendees',
              style: TextStyle(fontSize: 30),
            ),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/attendance.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded,
                            color: Colors.black, size: 25),
                        border: InputBorder.none,
                        hintText: 'Search member',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      onChanged: (value) {
                        filterAttendees(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredAttendees.length,
                    itemBuilder: (context, index) {
                      final attendee = filteredAttendees[index];
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${attendee.id}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${attendee.name}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Level: ${attendee.description}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Hall / Hostel: ${attendee.status}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (attendee.checked == true) {
                                      attendee.checked = false;
                                      _checkedCount--;
                                    } else {
                                      attendee.checked = true;
                                      _checkedCount++;
                                    }
                                  });
                                },
                                icon: Icon(
                                  attendee.checked == true
                                      ? Icons.check_circle
                                      : Icons.check_box_outline_blank,
                                  color: attendee.checked == true
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                iconSize: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final totalAttendees = attendees.length;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey,
                    title: const Text('Total Attendees'),
                    content: Text(
                        'Total members: $totalAttendees\nChecked in: $_checkedCount\nNot checked in: ${totalAttendees - _checkedCount}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.person),
          ),
        ));
  }
}
