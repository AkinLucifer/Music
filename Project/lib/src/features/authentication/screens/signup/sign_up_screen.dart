import 'package:flutter/material.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/signup/Signup_Footer_Wisget.dart';
import 'package:project/src/features/authentication/screens/signup/signup_form_Widget.dart';

import 'Signup_header_Widget.dart';



class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SignupHeaderWidget(size: size),
                RegistrationScreen(),
                SignupFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


