import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/features/authentication/screens/log_out.dart';
import 'package:project/src/features/authentication/screens/player_screen/player_screen.dart';
import 'package:project/src/features/authentication/screens/search_screen/search_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Play_List_Screen/play_list_screen.dart';

class NavigationMenu extends StatefulWidget {
  final token;

  const NavigationMenu({@required this.token, Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  Future<void> initSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', widget.token);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(widget.token));
    initSharedPref();
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          backgroundColor: bgbarColor,
          height: 80,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.music_note, color: Colors.white), label: "Music"),
            NavigationDestination(icon: Icon(Icons.search, color: Colors.white), label: "Search"),
            NavigationDestination(icon: Icon(Icons.add, color: Colors.white), label: "Playlist"),
            NavigationDestination(icon: Icon(Icons.exit_to_app, color: Colors.white), label: "LogOut"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex =0.obs;
  final String token;  // Add a token property to store the token
   NavigationController(this.token);
  final screens =[PlayerScreen(),SearchScreen(),PlayLisrScreen(),LogOut()];

}