import 'package:ye_phrases/data/model/ye_phrase_model.dart';

abstract class YePhrasesRemoteDataSource {
  Future<YePhraseModel> getYePhrase();
}

class YePhrasesRemoteDataSourceImpl implements YePhrasesRemoteDataSource {
  @override
  Future<YePhraseModel> getYePhrase() {
    // TODO: implement getYePhrase
    throw UnimplementedError();
  }
}
