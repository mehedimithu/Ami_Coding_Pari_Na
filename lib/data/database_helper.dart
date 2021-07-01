import 'package:ami_coding_pari_na/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class DatabaseHelper{
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper()=>_instance;

  static Database _bd;
  Future<Database> get db async{
    if(db !=null){
      return _bd;

    }
    _bd = await initDb();
    return _bd;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int response = await dbClient.insert("User", user.toMap());
    return response;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int response = await dbClient.delete("User");
    return response;
  }

}