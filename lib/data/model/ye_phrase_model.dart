import 'dart:convert';

import 'package:ye_phrases/domain/entity/ye_phrase.dart';

class YePhraseModel {
  final String quote;

  YePhraseModel({required this.quote});

  factory YePhraseModel.fromEntity(YePhrase entity) {
    return YePhraseModel(quote: entity.quote);
  }

  factory YePhraseModel.fromMap(Map<String, dynamic> map) {
    return YePhraseModel(quote: map['quote']);
  }

  factory YePhraseModel.fromJson(String source) =>
      YePhraseModel.fromMap(jsonDecode(source));
}
