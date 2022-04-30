import 'package:flutter/material.dart';
import 'package:ye_phrases/core/di/locator.dart';
import 'package:ye_phrases/presenter/pages/home_page.dart';

void main() {
  Locator.injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
