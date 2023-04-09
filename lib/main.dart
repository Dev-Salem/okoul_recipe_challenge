import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Hello World"));
  }
}

/*
httpCall() async {
  final dio = Dio();
  dio.options.headers['x-rapidapi-host'] = 'tasty.p.rapidapi.com';
  dio.options.headers['x-rapidapi-key'] =
      '488ca2004bmshd3f99dddbc793a0p15318ajsn0fcab92d8687';
  final response = await dio.get(
    'https://tasty.p.rapidapi.com/recipes/list',
    queryParameters: {
      'from': '0',
      'size': '20',
    },
  );

  print(response.data);
}
*/