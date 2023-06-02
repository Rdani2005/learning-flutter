import 'package:fl_qrscanner/models/models.dart';
import 'package:fl_qrscanner/providers/providers.dart';
import 'package:flutter/material.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  ScanModel? selectedScan;

  String selectedType = 'http';
  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(
      value: value,
    );

    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  chargeScansByType(String type) async {
    final scans = await DBProvider.db.getAllScansByType(type);
    if (scans != null) {
      this.scans = [];
      this.scans = [...scans];
      notifyListeners();
    }
  }

  chargeScans() async {
    final scans = await DBProvider.db.getAllScans();
    if (scans != null) {
      this.scans = [...scans];
      notifyListeners();
    }
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    scans.removeWhere((scan) => scan.id == id);
    notifyListeners();
  }
}
