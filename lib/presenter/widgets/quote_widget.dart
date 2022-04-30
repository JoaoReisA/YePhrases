import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({required this.quote, Key? key}) : super(key: key);

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectableText(
        '"$quote"',
        style: TextStyle(
            fontSize: quote.length >= 100 ? 15 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'PatrickHand'),
        textAlign: TextAlign.center,
      ),
    );
  }
}
