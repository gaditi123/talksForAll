// ignore_for_file: prefer_const_constructors

import './video_content_class.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPlayerScreen extends StatefulWidget {
  final VideoContent book;

  VideoPlayerScreen(this.book);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.book.videoURL);

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${widget.book.title}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Container(
                    width: 300,
                    // ignore: prefer_const_constructors
                    child: Divider(
                      height: 30,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    'Institute Name: ${widget.book.instituteName}',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(widget.book.description),
                  ),
                  Text(
                    'Panel Members:',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: widget.book.professors.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 160,
                        mainAxisExtent: 40,),
                      itemBuilder: (BuildContext context, int index) {
                        return Chip(
                          label: Text(widget.book.professors[index]),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      'Domains',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: widget.book.domains.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120,
                        mainAxisExtent: 40,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Chip(
                          label: Text(widget.book.domains[index]),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
