
// ignore_for_file: camel_case_types

import 'package:employee_attendance/welcome.dart';
import 'package:flutter/material.dart';

class unableToAttend extends StatefulWidget {
  const unableToAttend({super.key});

  @override
  State<unableToAttend> createState() => _unableToAttendState();
}

class _unableToAttendState extends State<unableToAttend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Leave Application',
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(26, 35, 26, 0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    const Text('Enter Your Reason For Leave',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        
                        labelText: 'Reason For Leave',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 50,
                        ),
                      ),
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 500,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Submit'),
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
