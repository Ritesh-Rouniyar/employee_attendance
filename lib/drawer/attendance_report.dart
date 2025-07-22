
import 'package:flutter/material.dart';
import 'package:employee_attendance/welcome.dart';

class AttendanceReport extends StatefulWidget {
  const AttendanceReport({super.key});

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Attendance Report',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color.fromARGB(255, 244, 244, 244),
                fontWeight: FontWeight.bold,
                fontSize: 25,
                // letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 212, 91, 105),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 25, 0,0),
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          
          ),
        ],
      ),
    );
  }
}
