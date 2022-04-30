import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({required this.quote, Key? key}) : super(key: key);

  final String quote;
  double get fontSize {
    if (quote.length >= 175) {
      return 13;
    } else if (quote.length >= 100) {
      return 15;
    } else {
      return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectableText(
        '"$quote"',
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'PatrickHand'),
        textAlign: TextAlign.center,
      ),
    );
  }
}
