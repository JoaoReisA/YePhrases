import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ye_phrases/data/model/ye_phrase_model.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';

import '../../mocks/fixture/fixture_reader.dart';

void main() {
  final jsonMock = fixture("ye_quote.json");
  group("ye phrase model test", () {
    group("fromEntity", () {
      test("Should return a model by a entity", () {
        final entity = YePhrase(quote: "quote");

        final result = YePhraseModel.fromEntity(entity);

        expect(result, isA<YePhraseModel>());
        expect(result.quote, equals("quote"));
      });
    });

    group("fromMap", () {
      test("Should return a model by a map", () {
        final map = json.decode(jsonMock);

        final result = YePhraseModel.fromMap(map);

        expect(result, isA<YePhraseModel>());
        expect(result.quote, equals(map['quote']));
      });
    });

    group("fromJson", () {
      test("Should return a model by a json", () {
        final source = jsonMock;

        final result = YePhraseModel.fromJson(source);

        expect(result, isA<YePhraseModel>());
      });
    });
  });
}
