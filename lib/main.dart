import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/pages/home_page.dart';
import 'package:flutter_application_5/ui/pages/character_info.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 6',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => const CharacterInfo(
              id: null,
            ),
      },
    );
  }
}
