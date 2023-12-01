import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/todo_model.dart';

class SqlController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    createDatabase();
    super.onInit();
  }

  late Database database;
  void createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
    debugPrint("database is created");
  }

  Future<void> deleteTheDatabase() async {
    // Delete the database
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
    debugPrint("database is deleted");
  }

  void openAppDatabase({required String path}) async {
    // open the database
    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      // todo => is our table name / primary key increment auto
      await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time TEXT, favorite INTEGER, complete INTEGER)');
    }, onOpen: (Database db) {
      database = db;
      debugPrint("database is opened");

      getAllData();
    });
  }

  List<TodoModel> _list = [];
  void getAllData() async {
    var allData = await database.query("todo");
    for (var i in allData) {
      debugPrint(i.toString());
      _list.add(TodoModel.fromJson(i));
    }
    debugPrint("${_list.length.toString()} : size _list ");
    debugPrint("${allData.toString()} : get data from database ");
    update();
  }

  void insertData() async {
    var insert = await database.insert(
      "todo",
      {
        "title": "flutter",
        "description": "I love flutter",
        "time": "10",
        "favorite": 0,
        "complete": 0,
      },
    );
    debugPrint("$insert : insert complete to database ");
    update();
  }

  void updateData() async {
    var updateData = await database.update(
      "todo",
      {
        "title": "play",
        "description": "go gym",
        "time": "12",
        "favorite": 1,
        "complete": 1,
      },
      where: "id = ${1}",
    );
    debugPrint("$updateData : update complete to database ");
    update();
  }

  void deleteData() async {
    var deleteItem = await database.delete('todo', where: "id = ${1}");
    debugPrint("$deleteItem : delete Item from database ");
    getAllData();
  }
}
