import 'package:dio/dio.dart';
import 'package:ye_phrases/core/endpoint.dart';
import 'package:ye_phrases/data/model/ye_phrase_model.dart';

import '../../core/error/exceptions.dart';

abstract class YePhrasesRemoteDataSource {
  Future<YePhraseModel> getYePhrase();
}

class YePhrasesRemoteDataSourceImpl implements YePhrasesRemoteDataSource {
  final Dio client;

  YePhrasesRemoteDataSourceImpl({required this.client});
  @override
  Future<YePhraseModel> getYePhrase() async {
    // client.options.headers["Content-Type"] = "application/json";
    final response = await client.get(Endpoints.phraseEndpoint);
    if (response.statusCode == 200) {
      return YePhraseModel.fromMap(response.data);
    } else {
      throw ServerException();
    }
  }
}
