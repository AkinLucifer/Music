import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/src/features/authentication/screens/Music_player_screen/music_player_screen.dart';

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final int year;
  final String duration;
  final String src;
  final String lyrics;
  final String fullPath;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.duration,
    required this.src,
    required this.lyrics,
    required this.fullPath,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['_id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      year: json['year'],
      duration: json['duration'],
      src: json['src'],
      lyrics: json['lyrics'],
      fullPath: json['fullPath'],
    );
  }
}

class PlayerScreen extends StatefulWidget {
  final token;

  const PlayerScreen({@required this.token, Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  Future<List<Song>> _fetchUserData() async {
    final response = await http.post(
      Uri.parse('http://192.168.97.237:3001/api/songs/get-all-songs'),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      }
    );


    print("Content-Type: ${response.headers['content-type']}");
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['success']) {
      var songs = (jsonResponse['data'] as List)
          .map((songJson) => Song.fromJson(songJson))
          .toList();
      return songs;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  void _handlePlayTap(BuildContext context, Song song) {
    // Implement the logic to play the selected song
    print('Playing ${song.title}');
    // You can add your audio playback logic here

    // Navigate to another page (replace MyNewPage with your actual page)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicPlayerScreen(song: song),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return SafeArea(child: Text("Error: ${snapshot.error}"));
          } else {
            final List<Song> songs = snapshot.data as List<Song>;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = songs[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "bold",
                      ),
                    ),
                    subtitle: Text(
                      data.artist,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: "regular",
                      ),
                    ),
                    leading: Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 32,
                    ),
                    trailing: InkWell(
                      onTap: () => _handlePlayTap(context, data),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

// Replace MyNewPage with your actual page

