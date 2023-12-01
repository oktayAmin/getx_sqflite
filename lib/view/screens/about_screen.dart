import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25, //change size on your need
          color: Colors.white, //change color on your need
        ),
        title: const Text('About Me', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          color: Colors.blue[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const InkWell(
            child: SizedBox(
              height: 180.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(
                      child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.start,
                          'My name is AminDev and communication way with me is smart100@gmail.com. if you have any questions just email me. if I could help you I would be glad.'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
