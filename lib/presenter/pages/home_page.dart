import 'package:flutter/material.dart';
import 'package:ye_phrases/core/di/locator.dart';
import 'package:ye_phrases/presenter/widgets/quote_widget.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
              onPressed: controller.callUsecase,
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/kanye_paper.png"),
          ),
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 170,
                child: ValueListenableBuilder(
                    valueListenable: controller.valueNotifier,
                    builder: (context, value, child) {
                      if (controller.failure == null) {
                        return QuoteWidget(quote: value.toString());
                      } else {
                        return const QuoteWidget(
                            quote: "Sorry, the server is off");
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
