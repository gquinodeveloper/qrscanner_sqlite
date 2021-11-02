//Gestión de estado
import 'package:app_qrscanner/app/models/scanner_model.dart';
import 'package:app_qrscanner/app/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScannerProvider extends ChangeNotifier {
  List<ScannerModel> scanners = [];

  //
  insertScanner(ScannerModel scanner) async {
    final res = await DBProvider.db.insertScanner(scanner);
    scanner.id = res;

    this.scanners.add(scanner);
    notifyListeners();
  }

  getAllScanners() async {
    final res = await DBProvider.db.getAllScanners();
    //this.scanners.addAll(res);
    this.scanners = [...res];
    notifyListeners();
    //return scanners;
  }
}
