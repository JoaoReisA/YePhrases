import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

import '../../core/error/failures.dart';

class YePhraseRepositoryImpl implements YePhraseRepository {
  @override
  Future<Either<Failure, YePhrase>> fetchPhrase() async {
    throw UnimplementedError();
  }
}
