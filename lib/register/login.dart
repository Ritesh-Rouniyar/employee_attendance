// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:employee_attendance/register/forgot_password.dart';
import 'package:employee_attendance/register/sign_up.dart';
import 'package:employee_attendance/welcome.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _MyFormState();
}

class _MyFormState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  // bool _confirmPasswordVisible = false;

  String? _validateUsername(value) {
    if (value == null || value!.isEmpty) {
      return 'please enter a username';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password enterd is incorrect';
    }
    return null;
  }

  void _loginform() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Signup Successful')));
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomePage(),),);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 212, 91, 105),
        title: const Text(
          'Log In To Your Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.20,
                child: ClipOval(
              child: Image.asset(
                'assets/images/wb.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: ' Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // validator: _validateUsername,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: ' Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // validator: _validatePassword,
                obscureText: !_passwordVisible,
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loginform,
                  child: const Text('Log In'),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text('Register Yourself'),
                  ),
                  // const SizedBox(width:65.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text('Forgot Password'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
