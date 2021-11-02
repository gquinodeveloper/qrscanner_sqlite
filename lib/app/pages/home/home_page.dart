import 'package:app_qrscanner/app/pages/home/widgets/scanner_button.dart';
import 'package:app_qrscanner/app/pages/home/widgets/scanners.dart';
import 'package:app_qrscanner/app/providers/scanner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRScanner"),
      ),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ScannerButton(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scannerProvider =
        Provider.of<ScannerProvider>(context, listen: false);

    _scannerProvider.getAllScanners();
    return Scanners();
  }
}
