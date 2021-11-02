import 'package:app_qrscanner/app/providers/scanner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scanners extends StatelessWidget {
  const Scanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scannerProvider = Provider.of<ScannerProvider>(context);
    final _scanners = _scannerProvider.scanners;

    return ListView.builder(
      itemCount: _scanners.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${_scanners[index].valor}"),
          leading: CircleAvatar(
            child: Text("${_scanners[index].id}"),
          ),
        );
      },
    );
  }
}
