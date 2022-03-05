import 'dart:ui';

import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({required this.quote, Key? key}) : super(key: key);

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Text(
          quote,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
