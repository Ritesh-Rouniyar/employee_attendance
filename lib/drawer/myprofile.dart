import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:employee_attendance/drawer/unable_to_attend.dart';
import 'package:employee_attendance/register/login.dart';
import 'package:employee_attendance/welcome.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(26, 222, 183, 55),
              ),
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset('assets/images/me.jpg'),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  'My Profile',
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Myprofile(),
                    ),
                  );
                }),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text(
                'Site Messages',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text(
                'Incident Reports',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text(
                'Unable to Attend',
              ),
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
              leading: const Icon(Icons.shopping_cart),
              title: const Text(
                'Consumables',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height:deviceHeight * 0.05,
            ),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/me.jpg'),
          ),
          SizedBox(
            height:deviceHeight * 0.010,
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0,5),
                    color: Colors.blueGrey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('Name'),
                subtitle: Text('Christopher Henry'),
                leading: Icon(CupertinoIcons.person_fill),
              ),
            ),
          ),
          SizedBox(
            height:deviceHeight * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.blueGrey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('Address'),
                subtitle: Text('Biratnagar, Nepal'),
                leading: Icon(CupertinoIcons.home),
              ),
            ),
          ),
          SizedBox(
            height:deviceHeight * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.blueGrey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('contact'),
                subtitle: Text('+977-9812345678'),
                leading: Icon(CupertinoIcons.phone_fill),
              ),
            ),
          ),
          SizedBox(
            height:deviceHeight * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.blueGrey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('e_Mail'),
                subtitle: Text('abc@gmail.com'),
                leading: Icon(CupertinoIcons.mail_solid),
              ),
            ),
          ),
          SizedBox(
            height:deviceHeight * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.blueGrey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('Designation'),
                subtitle: Text('Officer'),
                leading: Icon(CupertinoIcons.person_2_fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
