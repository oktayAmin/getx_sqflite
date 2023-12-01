import 'package:flutter/material.dart';
import 'package:flutter_getx_sqlite/controller/controller.dart';
import 'package:get/get.dart';

class AddTodo extends StatefulWidget {
  AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controller = Get.put(SqlController());
  late TextEditingController _controller_title;
  late TextEditingController _controller_dis;
  late TextEditingController _controller_time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller_title = TextEditingController();
    _controller_dis = TextEditingController();
    _controller_time = TextEditingController();
  }

  @override
  void dispose() {
    _controller_title.dispose();
    _controller_dis.dispose();
    _controller_time.dispose();
    super.dispose();
  }

  void addTodb(String t, String d, String m) {
    controller.addTodo(t, d, m);
  }

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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 18.0, horizontal: 23.0),
            child: TextField(
              controller: _controller_title,
              style:
                  TextStyle(decorationColor: Colors.blue, color: Colors.blue),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title ...',
              ),
              // controller: myController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 23.0),
            child: TextField(
              controller: _controller_dis,
              style:
                  TextStyle(decorationColor: Colors.blue, color: Colors.blue),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description ...',
              ),
              // controller: myController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 23.0),
            child: TextField(
              controller: _controller_time,
              style:
                  TextStyle(decorationColor: Colors.blue, color: Colors.blue),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Time ...',
              ),
              // controller: myController,
            ),
          ),

          //
          Container(
            width: 280.0,
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 23.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                if (_controller_time.text.length != null &&
                    _controller_title.text.length != null &&
                    _controller_dis.text != null) {
                  addTodb(_controller_title.text, _controller_dis.text,
                      _controller_time.text);
                }
                print(_controller_time.text);
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
