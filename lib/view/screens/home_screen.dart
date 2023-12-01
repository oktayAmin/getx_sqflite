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
            icon: Icon(
              color: Colors.white,
              Icons.remove,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.insertData();
            },
            icon: Icon(
              color: Colors.white,
              Icons.add,
            ),
          ),
        ],
        title: Text('home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              //
              controller.updateData();
            },
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              //
              controller.deleteData();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
