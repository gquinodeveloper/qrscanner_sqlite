import 'package:app_qrscanner/app/pages/home/home_page.dart';
import 'package:app_qrscanner/app/providers/scanner_provider.dart';
import 'package:app_qrscanner/otra.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ScannerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        //home: HomePage(),
        home: Temporal(),
      ),
    );
  }
}
