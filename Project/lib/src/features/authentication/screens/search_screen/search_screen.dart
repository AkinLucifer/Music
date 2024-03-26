import 'package:flutter/material.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/sizes.dart';

import '../../models/songs_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {

  static List<songModel> song_list =[

  ];

  void searchList(String value) {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search for Songs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: bgbarColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: Rock",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.white30,
                ),
              ),
              SizedBox(
                height: tFormHeight + 20,
              ),
              Expanded(
                child: ListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
