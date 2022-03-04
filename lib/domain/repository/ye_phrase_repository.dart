import 'package:ye_phrases/domain/entity/ye_phrase.dart';

abstract class YePhraseRepository {
  Future<YePhrase> fetchPhrase();
}
