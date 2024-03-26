import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:project/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:project/src/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({@required this.token}) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system ,
      home: WelcomeScreen(),
    );
  }
}