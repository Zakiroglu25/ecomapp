import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 164.0,
                color: Colors.orange,
              ),
            ],
          ),
          Positioned(
            top: 104.0,
            child: Container(
              height: 140.0,
              width: 140.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          Positioned(
            top: 116.0,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
