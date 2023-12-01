import 'package:flutter/material.dart';
import 'package:flutter_getx_sqlite/controller/controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SqlController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.deleteTheDatabase();
              },
              icon: Icon(Icons.remove))
        ],
        title: Text('home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
