import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

import '../model/wish_model.dart';

class LocalDataSource{
  static final LocalDataSource instance = LocalDataSource._init();
  static Database? _database;
  static const String tableName = "wishTable";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnDescription = "description";
  LocalDataSource._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB("wishHH.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version)async{
    await db.execute(
      '''
      create table $tableName(
         $columnId integer primary key autoincrement,
         $columnTitle text not null,
         $columnDescription  text not null
      )
      '''
    );
  }

    Future<WishModel> insert(WishModel wishModel)async{
     final Database db = await instance.database;
    wishModel.id =   await db.insert(tableName,wishModel.toJson());
      return wishModel;
    }

    Future<List<WishModel>> getAllWishes()async{
    final Database db = await instance.database;
    List<Map<String,dynamic>> maps = await db.query(tableName);
    return maps.map((e) => WishModel.fromJson(e)).toList();
    }

    Future<WishModel?> getAWish(int id)async{
    final Database db = await instance.database;
    List<Map<String,dynamic>> maps = await db.query(tableName,
    columns: [columnId,columnTitle,columnDescription],
      where: "$columnId = ?",
      whereArgs: [id]
    );
    if(maps.isNotEmpty){
          return WishModel.fromJson(maps.first);
    }
    return null;
    }

    Future<int> delete(int id)async{
    final Database db = await instance.database;
    return await db.delete(tableName,where: "$columnId = ?",whereArgs: [id]);
    }
    
    Future<int> update(WishModel wishModel)async{
    final Database db = await instance.database;
    return await db.update(tableName, wishModel.toJson(), where: "$columnId = ?" , whereArgs: [wishModel.id]);
    }
    
}