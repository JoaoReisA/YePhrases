import 'package:dartz/dartz.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';
import 'package:ye_phrases/presenter/controller/home_page_controller.dart';

import '../../mocks/classMocks/usecases/fetch_phrase_usecase_mock.dart';

void main() {
  late FetchPhraseUsecase usecase;
  late HomePageController controller;
  setUp(() {
    usecase = MockFetchPhraseUsecase();
    controller = HomePageController(fetchPhraseUsecase: usecase);
  });
  group("home page controller test", () {
    group("callUsecase", () {
      test(" Should  call the usecase with sucess and fill the quote variable",
          () async {
        when(() => usecase())
            .thenAnswer((invocation) async => Right(YePhrase(quote: "quote")));

        await controller.callUsecase();

        expect(controller.failure, isNull);
        expect(controller.quote, equals("quote"));
      });
      test(
          " Should call the usecase with Failure and fill the failure variable",
          () async {
        when(() => usecase())
            .thenAnswer((invocation) async => Left(ServerFailure()));

        await controller.callUsecase();

        expect(controller.failure, isNotNull);
        expect(controller.quote, isEmpty);
      });
    });

    group("share", () {
      test("Should call shareToWhatsApp function and succed", () async {
        when(() => FlutterShare.share(
            title: any(named: "title"),
            text: any(named: "text"))).thenAnswer((invocation) async => true);
        final msg = "msg";
        await controller.share();

        verify(() => FlutterShare.share(
            title: any(named: "title"), text: any(named: "text")));
      });
    });
  });
}
