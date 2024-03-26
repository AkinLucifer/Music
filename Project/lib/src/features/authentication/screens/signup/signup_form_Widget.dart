import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/src/constants/config.dart';

import '../login/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isNotValidate = false;
  bool _passwordVisible = false;

  Future<void> myRegistration(String name, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      try {
        var regBody = {
          "email": email,
          "password": password,
          "name": name,
        };

        var response = await http.post(
          Uri.parse(registration),
          body: jsonEncode(regBody),
          headers: {"Content-Type": "application/json"},
        );
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);

          if (jsonResponse['success']) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          } else {
            // Handle unsuccessful registration
            // You might want to show an error message to the user
            print(jsonResponse['message']);
          }
        }
      } catch (error) {
        // Handle other errors
        print('Error: $error');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Full Name",
                hintText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.remove_red_eye : Icons.remove_red_eye_sharp,
                  ),
                ),
              ),
              obscureText: !_passwordVisible,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  myRegistration(nameController.text, emailController.text, passwordController.text);
                },
                child: Text("Sign Up".toUpperCase()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
