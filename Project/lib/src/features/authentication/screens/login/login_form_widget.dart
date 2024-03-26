import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:project/src/features/authentication/screens/player_screen/player_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/config.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    late SharedPreferences prefs;
    bool _passwordVisible = false;

    Future<void> initSharedPref() async {
      prefs = await SharedPreferences.getInstance();
    }

    @override
    void initState() {
      super.initState();
      initSharedPref();
    }

    void myLoginFunction() async {
      await initSharedPref();
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        var reqBody = {
          "email": emailController.text,
          "password": passwordController.text
        };

        var response = await http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody),
        );

        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success']) {
          var myToken = jsonResponse['data'];
          prefs.setString('token', myToken);
          print("this is the token " + myToken);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerScreen(token: myToken)));
        } else {
          print("something went wrong");
        }
      }
    }

    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          SizedBox(
            height: tFormHeight,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: tPassword,
              hintText: tPassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  _passwordVisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_sharp,
                ),
              ),
            ),
            obscureText: !_passwordVisible,
          ),
          const SizedBox(
            height: tFormHeight - 5,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text(tForgotPassword))),
          const SizedBox(
            height: tFormHeight + 20,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: myLoginFunction,
                child: Text(tLogin.toUpperCase()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              )),
        ],
      ),
    ));
  }
}
