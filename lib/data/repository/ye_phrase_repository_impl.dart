import 'package:dio/dio.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/repository/ye_phrase_repository.dart';

class YePhraseRepositoryImpl implements YePhraseRepository {
  final Dio client;

  YePhraseRepositoryImpl({required this.client});

  @override
  Future<YePhrase> fetchPhrase() async {
    throw UnimplementedError();
  }
}
