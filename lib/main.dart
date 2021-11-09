import 'package:flutter/material.dart';
import 'package:list_items/login_screen/pages/login_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Item List',
        debugShowCheckedModeBanner: false,
        home: loginPage());
  }
}
