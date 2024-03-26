import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:project/src/features/authentication/screens/player_screen/player_screen.dart';

import '../../../../constants/config.dart';

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;

  var temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            // Check if the swipe is from left to right (right to left is negative)
            if (details.primaryVelocity! > 0) {
              // Navigate back when the swipe is detected
              player.pause();
              Navigator.pop(context);

            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Now Playing: ${widget.song.title} by ${widget.song.artist}'),
              SizedBox(height: 20),
              // Add album cover or music player visualization here
              // Add song details (title, artist, etc.) here
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(isPlaying ?Icons.play_arrow : Icons.pause),
                    iconSize: 50,
                    onPressed: () {
                      playPause();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    iconSize: 50,
                    onPressed: () {
                      stop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void playPause() async{
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setUrl(url+'/api/songs/get-song/${widget.song.src}');
      player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void stop() {
    player.stop();
    setState(() {
      isPlaying = false;
    });
  }

}

class MusicPlayerScreen extends StatefulWidget {
  final Song song;

  MusicPlayerScreen({required this.song});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}


// import 'dart:convert';
// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';
// import 'package:project/src/features/authentication/screens/player_screen/player_screen.dart';
//
//
// class MusicPlayerScreen extends StatefulWidget {
//   final Song song;
//
//   MusicPlayerScreen({required this.song});
//
//   @override
//   _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
// }
//
// class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   String audioUrl = '';
//
//   @override
//   void initState() {
//     final player = AudioPlayer();
//     player.play(UrlSource('http://localhost:3001/api/songs/get-song/Water.mp3'));
//     super.initState();
//     // fetchAudio();
//
//   }
//
//   Future<void> fetchAudio() async {
//     final response = await http.get(Uri.parse('http://localhost:3001/api/songs/get-song/Water.mp3'));
//
//     if (response.statusCode == 200) {
//       print(response.body);
//       final audioBlob = response.bodyBytes;
//       final audioUrl = Uri.parse('data:audio/mp3;base64,' + base64Encode(audioBlob)).toString();
//       setState(() {
//         this.audioUrl = audioUrl;
//       });
//       audioPlayer.play(UrlSource(audioUrl));
//     } else {
//       throw Exception('Failed to load audio');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player'),
//       ),
//       body: Center(
//         child: audioUrl.isNotEmpty
//             ? AudioPlayerWidget(audioUrl: audioUrl)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// class AudioPlayerWidget extends StatelessWidget {
//   final String audioUrl;
//
//   AudioPlayerWidget({required this.audioUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//
//       ),
//     );
//   }
// }












