import 'package:employee_attendance/welcome.dart';
import 'package:flutter/material.dart';

class SiteMessage extends StatefulWidget {
  const SiteMessage({super.key});

  @override
  State<SiteMessage> createState() => _SiteMessageState();
}

class _SiteMessageState extends State<SiteMessage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Messages From Admin',
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
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                 SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date : 25/11/2024'),
                SizedBox(height: deviceHeight * 0.002),
                const Text(
                  'Your Leave Application Has Been Submitted Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),        
        ],
      ),
    );
  }
}
