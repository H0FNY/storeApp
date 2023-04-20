import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  static String id ='HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
