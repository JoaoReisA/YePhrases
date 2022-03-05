import 'package:flutter/foundation.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';
import 'package:dartz/dartz.dart';

class HomePageController {
  final FetchPhraseUsecase fetchPhraseUsecase;

  HomePageController({required this.fetchPhraseUsecase});
  String quote = "";
  Failure? failure;
  final ValueNotifier<String> valueNotifier = ValueNotifier("");
  void init() async {
    await callUsecase();
  }

  Future<void> callUsecase() async {
    final usecaseResponse = await fetchPhraseUsecase();
    usecaseResponse.fold(
      (l) => failure = l,
      (r) => quote = r.quote,
    );
    valueNotifier.value = quote;
  }
}
