import 'package:dartz/dartz.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

import '../../core/error/failures.dart';

abstract class FetchPhraseUsecase {
  Future<Either<Failure, YePhrase>> call();
}

class FetchPhraseUsecaseImpl implements FetchPhraseUsecase {
  final YePhraseRepository repository;

  FetchPhraseUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, YePhrase>> call() async {
    final phrase = await repository.fetchPhrase();
    return phrase;
  }
}
