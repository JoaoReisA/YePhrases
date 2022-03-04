import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ye_phrases/core/error/exceptions.dart';
import 'package:ye_phrases/data/datasources/ye_phrases_remote_datasource.dart';
import 'package:ye_phrases/data/model/ye_phrase_model.dart';

import '../../mocks/classMocks/external/dio_mock.dart';
import '../../mocks/fixture/fixture_reader.dart';

void main() {
  late Dio client;
  late YePhrasesRemoteDataSource remoteDatasource;
  setUp(() {
    client = MockDio();
    remoteDatasource = YePhrasesRemoteDataSourceImpl(client: client);
  });
  group("ye phrases remote datasource test", () {
    group("getYePhrase", () {
      test("Should get a ye phrase", () async {
        when(() => client.get(any())).thenAnswer((invocation) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: "https://api.kanye.rest"),
            data: fixture("ye_quote.json")));

        final result = await remoteDatasource.getYePhrase();
        final map = json.decode(fixture("ye_quote.json"));
        expect(result, isA<YePhraseModel>());
        expect(result.quote, equals(map['quote']));
      });

      test(" Should try to get a YePhrase and return an error", () async {
        when(() => client.get(any())).thenThrow(ServerException());

        final result = remoteDatasource.getYePhrase;
        expect(() => result(), throwsA(const TypeMatcher<ServerException>()));
      });
    });
  });
}
