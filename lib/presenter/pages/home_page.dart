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
        actions: [
          IconButton(
              iconSize: 24,
              onPressed: () => controller.callUsecase(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Center(
              child: ValueListenableBuilder(
                  valueListenable: controller.valueNotifier,
                  builder: (context, value, child) {
                    return QuoteWidget(quote: value.toString());
                  }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/ye_photo2.png"),
          )
        ],
      ),
    );
  }
}
