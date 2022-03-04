import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';

import '../../mocks/classMocks/repository/ye_phrase_repository_mock.dart';

void main() {
  late YePhraseRepository repository;
  late FetchPhraseUsecase usecase;
  setUp(() {
    repository = MockYePhrasesRepository();
    usecase = FetchPhraseUsecaseImpl(repository: repository);
  });
  group("fetch phrase usecase test", () {
    test("Should return a ye quote", () async {
      when(() => repository.fetchPhrase())
          .thenAnswer((invocation) async => YePhrase(quote: "quote"));

      final result = await usecase();

      expect(result, isA<YePhrase>());
      expect(result.quote, equals("quote"));
    });
  });
}
