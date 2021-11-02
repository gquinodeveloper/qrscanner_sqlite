import 'dart:io';
import 'package:app_qrscanner/app/models/scanner_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //Instacia singleton

  static final DBProvider db = DBProvider._();
  DBProvider._();

  //Get - retornar la instacia
  static late Database _databasetemp;
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database ?? _databasetemp;
    _database = await initDB();

    return _database ?? _databasetemp;
  }

  Future<Database> initDB() async {
    //Directorio donde se creará la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    //Debemos crear la base de datos
    final path = join(documentsDirectory.path, "QRScannerBD.db");
    print(path);

    return openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scanner(
          id INTEGER PRIMARY KEY,
          valor TEXT
        )
        ''');
      },
    );
  }

  //CRUD

  //Forma larga
  Future<int> insertLargo(ScannerModel scanner) async {
    //Verificar la BD
    final db = await database;
    final res = await db.rawInsert('''
    INSERT INTO Scanner (id, valor)
    VALUES(${scanner.id}, ${scanner.valor})
    ''');
    return res;
  }

  //Forma corta

  //INSERT
  Future<int> insertScanner(ScannerModel scanner) async {
    //Verificar la BD
    final db = await database;
    final res = await db.insert("Scanner", scanner.toJson());
    print(res);
    return res;
  }

  //DELETE
  Future<int> deleteScanner(int id) async {
    //Verificar la BD
    final db = await database;
    final res = await db.delete("Scanner", where: "id = ?", whereArgs: [id]);
    return res;
  }

  //LIST
  Future<List<ScannerModel>> getAllScanners() async {
    //Verificar la BD
    final db = await database;
    final res = await db.query("Scanner");

    return res.isNotEmpty
        ? res.map((json) => ScannerModel.fromJson(json)).toList()
        : [];
  }

  //UPDATE
  Future<int> updateScanner(ScannerModel scanner) async {
    //Verificar la BD
    final db = await database;
    final res = await db.update("Scanner", scanner.toJson(),
        where: "id = ?", whereArgs: [scanner.id]);
    return res;
  }
}
