import 'package:flutter/foundation.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';

class HomePageController {
  final FetchPhraseUsecase fetchPhraseUsecase;
  final FlutterShareMe flutterShareMe;
  HomePageController(
      {required this.fetchPhraseUsecase, required this.flutterShareMe});
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

  Future<void> shareToWhatsApp(String msg) async {
    await flutterShareMe.shareToWhatsApp(msg: msg);
  }
}
