import 'package:flutter/material.dart';

class Temporal extends StatelessWidget {
  const Temporal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.black,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
