import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/src/features/authentication/screens/signup/sign_up_screen.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())),
          child: Text.rich(TextSpan(
              text: tCreateAccount,
              style: TextStyle(color: Colors.black54),
              children: const [
                TextSpan(
                  text: tSignp,
                  style: TextStyle(color: Colors.blue),
                )
              ])),
        ),
      ],
    );
  }
}