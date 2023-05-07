import 'package:flutter/material.dart';

class SourceScreen extends StatelessWidget {
  const SourceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
      ),
      body: Center(child: Text("Source Screen")),
    );
  }
}
