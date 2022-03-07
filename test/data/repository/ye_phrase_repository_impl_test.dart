import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ye_phrases/core/error/exceptions.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/data/datasources/ye_phrases_remote_datasource.dart';
import 'package:ye_phrases/data/model/ye_phrase_model.dart';
import 'package:ye_phrases/data/repository/ye_phrase_repository_impl.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

import '../../mocks/classMocks/datasource/ye_phrase_remote_datasource_mock.dart';

void main() {
  late YePhrasesRemoteDataSource remoteDataSource;
  late YePhraseRepository repository;
  setUp(() {
    remoteDataSource = MockYePhrasesRemoteDataSource();
    repository = YePhraseRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group(" ye phrase repository impl test", () {
    group("fetchPhrase", () {
      test("Should return a YePhrase", () async {
        final yePhrase = YePhraseModel(quote: "quote");
        when(() => remoteDataSource.getYePhrase())
            .thenAnswer((invocation) async => yePhrase);

        final result = await repository.fetchPhrase();

        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r.quote), yePhrase.quote);
      });

      test("Should try to return a YePhrase and return an error", () async {
        when(() => remoteDataSource.getYePhrase()).thenThrow(ServerException());

        final result = await repository.fetchPhrase();

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r.quote), isA<ServerFailure>());
      });
    });
  });
}
