import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/login/login_screen.dart';
import 'package:project/src/features/authentication/screens/signup/sign_up_screen.dart';
import 'package:project/src/features/authentication/screens/signup/signup_form_Widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:  tPrimaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.6,
            ),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  tWelcomeSubTitle,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),

                        child: Text(tLogin.toUpperCase()))),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tDarkColor,
                          foregroundColor: tWhiteColor,
                        ),
                        child: Text(tSignp.toUpperCase()))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
