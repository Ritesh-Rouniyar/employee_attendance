import 'package:flutter/material.dart';
import 'package:employee_attendance/qr_scanner.dart';
import 'package:employee_attendance/drawer/attendance_report.dart';
import 'package:employee_attendance/drawer/myprofile.dart';
import 'package:employee_attendance/drawer/site_message.dart';
import 'package:employee_attendance/drawer/unable_to_attend.dart';
import 'package:employee_attendance/register/login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;
  String qrText = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // You can later add navigation here based on index if needed
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 212, 91, 105),
        title: const Center(
          child: Text(
            'Welcome Mr. XYZ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.0,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: ClipOval(
              child: Image.asset('assets/images/me.jpg', fit: BoxFit.fitHeight),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 91, 105),
              ),
              child: CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset('assets/images/me.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Myprofile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Admin Messages'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SiteMessage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_copy_sharp),
              title: const Text('Report'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendanceReport(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Leave Application'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const unableToAttend(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const loginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight * 0.005),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tap Below for your attendance",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_2, size: 140, color: Colors.grey[400]),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QrScanner(),
                      ),
                    );

                    if (result != null && result is String) {
                      setState(() {
                        qrText = result;
                      });
                    }
                  },
                  backgroundColor: const Color.fromARGB(255, 222, 41, 41),
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.03),
          Text(
            qrText.isNotEmpty ? 'Scanned QR Code: $qrText' : '',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Admin Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 234, 23, 23),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
