import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(YaseenApp());
}

class YaseenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaseen Portfolio',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
