import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Ye Quotes"),
      ),
      body: Column(
        children: [
          //TODO: Put the quotes here
          Image.asset("assets/images/ye.png")
        ],
      ),
    );
  }
}
