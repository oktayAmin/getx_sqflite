import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_sqlite/controller/controller.dart';
import 'package:flutter_getx_sqlite/view/screens/about_screen.dart';
import 'package:flutter_getx_sqlite/view/screens/add_todo.dart';
import 'package:flutter_getx_sqlite/view/widgets/item_todo.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SqlController());
  static const int _pressedColorBlue = 0xFF90CAF9;
  static const int _pressedColorWhite = 0xFFFFFFFF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 1,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TODO Application',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    'Write By AminDev',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.favorite),
                      color: Colors.lightBlue),
                  title: const Text(
                      style: TextStyle(color: Colors.blue), 'Favorites'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(
                  child: const Divider(
                    height: 5.0,
                    endIndent: 0,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.account_box_outlined),
                      color: Colors.lightBlue),
                  title: const Text(
                      style: TextStyle(color: Colors.blue), 'About Me'),
                  onTap: () {
                    Get.to(() => AboutMe());
                  },
                ),
                SizedBox(
                  child: const Divider(
                    height: 5.0,
                    endIndent: 0,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.lightBlue),
                  title:
                      const Text(style: TextStyle(color: Colors.blue), 'Exit'),
                  onTap: () {
                    // Update the state of the app.
                    SystemNavigator.pop();
                    // ...
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25, //change size on your need
          color: Colors.white, //change color on your need
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       controller.deleteTheDatabase();
        //     },
        //     icon: Icon(
        //       color: Colors.white,
        //       Icons.remove,
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //       controller.insertData();
        //     },
        //     icon: Icon(
        //       color: Colors.white,
        //       Icons.add,
        //     ),
        //   ),
        // ],
        title: Text('TODO', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: GetBuilder<SqlController>(
        builder: (controller) => ListView.builder(
            itemCount: controller.lists.length,
            itemBuilder: (context, index) =>
                ItemTodo(controller: controller, index: index)),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Get.to(() => AddTodo());
        },
        icon: Icon(Icons.add),
        style: ButtonStyle(
          iconSize: MaterialStateProperty.all(35.0),
          iconColor: MaterialStateColor.resolveWith(
              (states) => Color(_pressedColorWhite)),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Color(_pressedColorBlue),
          ),
        ),
      ),
    );
  }
}
