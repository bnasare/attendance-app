import 'package:flutter/material.dart';
import 'attendees_page.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/knust_coc_logo.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AttendeesPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                    200, 50),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30),
                ),
              ),
              child: const Text('Get Started', style: TextStyle(fontSize: 18),),
            ),
          ),
        ),
      ],
      ),
    ),
    );
  }}