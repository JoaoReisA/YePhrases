import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

abstract class FetchPhraseUsecase {
  Future<YePhrase> call();
}

class FetchPhraseUsecaseImpl implements FetchPhraseUsecase {
  final YePhraseRepository repository;

  FetchPhraseUsecaseImpl({required this.repository});

  @override
  Future<YePhrase> call() async {
    final phrase = repository.fetchPhrase();
    return await phrase;
  }
}
