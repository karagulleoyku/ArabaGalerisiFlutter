import 'package:flutter/material.dart';
import 'AnaSayfa.dart';


void main() => runApp(GaleriApp());

class GaleriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}



