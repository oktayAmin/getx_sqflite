import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    createDatabase();
    super.onInit();
  }

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
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, favorite INTEGER, complete INTEGER)');
    }, onOpen: (Database database) {
      debugPrint("database is opened");
    });
  }

  void getAllData() {}

  void insertData() {}

  void updateData() {}

  void deleteData() {}
}
