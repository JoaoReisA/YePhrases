import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ye_phrases/core/di/locator.dart';
import 'package:ye_phrases/presenter/widgets/quote_widget.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = locator.get();
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Ye Quotes"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: controller.valueNotifier,
              builder: (context, value, child) {
                return QuoteWidget(quote: value.toString());
              }),
          Image.asset("assets/images/ye.png")
        ],
      ),
    );
  }
}
