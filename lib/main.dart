import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:imtihon_exam/view/HomePage.dart';

import 'core/storage.dart';
import 'models/cards_model.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CardsModelAdapter());

  box = await Hive.openBox('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/HomePage': (context) => const HomePage(),
      },
    );
  }
}
