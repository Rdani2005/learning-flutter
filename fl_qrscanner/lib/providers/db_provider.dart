import 'dart:io';

import 'package:fl_qrscanner/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path to keep up the BD.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // Creating the DB on the app dir.
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    // Create DB.
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        );
      ''');
    });
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : null;
  }

  Future<List<ScanModel>?> getAllScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : null;
  }

  Future<int> updateScan(ScanModel updateScan) async {
    final db = await database;
    final res = await db.update(
      'Scans',
      updateScan.toJson(),
      where: "id = ?",
      whereArgs: [updateScan.id],
    );

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete(
      'Scans',
      where: "id = ?",
      whereArgs: [id],
    );

    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete(
      'Scans',
    );

    return res;
  }
}
