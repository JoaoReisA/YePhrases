import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ye_phrases/core/error/exceptions.dart';
import 'package:ye_phrases/data/datasources/ye_phrases_remote_datasource.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

import '../../core/error/failures.dart';

class YePhraseRepositoryImpl implements YePhraseRepository {
  final YePhrasesRemoteDataSource remoteDataSource;

  YePhraseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, YePhrase>> fetchPhrase() async {
    try {
      final remoteQuote = await remoteDataSource.getYePhrase();
      return Right(remoteQuote.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
