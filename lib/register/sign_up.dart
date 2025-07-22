import 'package:flutter/material.dart';
import 'package:employee_attendance/register/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _MyFormState();
}

class _MyFormState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  List<String> countryCodes = ['+1', '+91', '+44', '+61', '+81'];
  String selectedCountryCode = '+1';

  String? _validateUsername(value) {
    if (value == null || value.isEmpty) {
      return 'please enter a username';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'please enter an e-Mail';
    }
    RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'please enter a valid e-Mail';
    }
    return null;
  }

  String? _validatePhone(value) {
    if (value == null || value.isEmpty) {
      return 'please enter the contact number';
    }
    RegExp contactRegExp = RegExp(r"^[0-9]{10}");

    if (!contactRegExp.hasMatch(value)) {
      return 'please enter a valid contact number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Combine selected country code with phone number
      String fullPhoneNumber = '$selectedCountryCode ${contactController.text}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup Successful with contact: $fullPhoneNumber'),
          backgroundColor: Colors.amber,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const loginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const loginPage(),
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 212, 91, 105),
        title: const Text(
          'Register Your Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(26, 35, 26, 0),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/wb.jpg'),
                      radius: 80,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: _validateUsername,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'e-Mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: selectedCountryCode,
                            items: countryCodes.map((String code) {
                              return DropdownMenuItem<String>(
                                value: code,
                                child: Text(code),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountryCode = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Country Code',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: contactController,
                            decoration: InputDecoration(
                              labelText: 'Contact',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: _validatePhone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                      validator: _validatePassword,
                      obscureText: !_passwordVisible,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: _validateConfirmPassword,
                      obscureText: !_confirmPasswordVisible,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitForm,
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
