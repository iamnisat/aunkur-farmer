// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper();
  final _databaseName = "aunkur_farmer.db";
  final _databaseVersion = 4;

  // ====Login Table
  static const String loginTable = 'login';
  static const String columnId = '_id';
  static const String columnToken = 'token';
  static const String columnName = 'name';
  static const String columnExternalUserTypeId = 'external_user_type_id';
  static const String columnUsername = 'username';
  static const String columnImage = 'image';
  static const String columnPhone = 'phone';
  static const String columnEmail = 'email';
  static const String columnDistrict = 'district';
  static const String columnDivision = 'division';
  static const String columnUpazila = 'upazila';
  static const String columnUnion = 'union';
  static const String columnServiceCenterId = 'service_center_id';

  // Notification Table
  static const String notificationTable = 'notification';
  static const String columnTitle = 'title';
  static const String columnBody = 'body';
  static const String columnImageUrl = 'image_url';
  static const String columnRouteName = 'route_name';
  static const String columnIsOpened = 'is_opened';
  static const String columnCreateTime = 'create_time';
  static const String columnUpdatedAt = 'updated_at';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database

  Future<Database?> database() async {
    Database? database;
    var databasesPath = await getDatabasesPath();
    deleteDatabase(databasesPath);
    // ignore: unnecessary_null_comparison
    if (database != null) {
      return database;
    } else {
      database = await _initDatabase();
    }

    return database;
  }

  // SQL code to initialize database
  _initDatabase() async {
    debugPrint("---------init database---------");
    await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
  try {
    await db.execute('''
      CREATE TABLE $loginTable(
        $columnId INTEGER PRIMARY KEY,
        $columnToken TEXT,
        $columnName TEXT,
        $columnExternalUserTypeId INT,
        $columnUsername TEXT,
        $columnImage TEXT,
        $columnPhone TEXT,
        $columnEmail TEXT,
        $columnDistrict TEXT,
        $columnDivision TEXT,
        $columnUpazila TEXT,
        `$columnUnion` TEXT,
        $columnServiceCenterId INT
      )
    ''');

    await db.execute('''
      CREATE TABLE $notificationTable (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT,
        $columnBody TEXT,
        $columnImageUrl TEXT,
        $columnRouteName TEXT,
        $columnIsOpened INTEGER,
        $columnCreateTime INT
      )
    ''');
  } catch (e) {
    debugPrint(e.toString());
  }
}

}
