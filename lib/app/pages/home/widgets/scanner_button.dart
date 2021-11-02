import 'package:app_qrscanner/app/models/scanner_model.dart';
import 'package:app_qrscanner/app/providers/scanner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.qr_code_2_outlined),
      onPressed: () {
        print("Iniciando");
        final _scannerProvider =
            Provider.of<ScannerProvider>(context, listen: false);

        ScannerModel scanner = new ScannerModel(valor: "Gustavo");
        _scannerProvider.insertScanner(scanner);

        print("Fin");
      },
    );
  }
}
