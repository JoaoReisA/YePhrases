import 'package:dartz/dartz.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';

abstract class YePhraseRepository {
  Future<Either<Failure, YePhrase>> fetchPhrase();
}
