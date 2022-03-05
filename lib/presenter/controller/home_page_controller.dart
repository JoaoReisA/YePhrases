import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';
import 'package:dartz/dartz.dart';

class HomePageController {
  final FetchPhraseUsecase fetchPhrase;

  HomePageController({required this.fetchPhrase});
  String quote = "";
  Failure? failure;
  void init() {
    callUsecase();
  }

  void callUsecase() async {
    final usecaseResponse = await fetchPhrase();
    usecaseResponse.fold(
      (l) => failure = l,
      (r) => quote = r.quote,
    );
  }
}
