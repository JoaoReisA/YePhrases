import 'package:dartz/dartz.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ye_phrases/core/error/failures.dart';
import 'package:ye_phrases/domain/entity/ye_phrase.dart';
import 'package:ye_phrases/domain/usecases/fetch_pharase_usecase.dart';
import 'package:ye_phrases/presenter/controller/home_page_controller.dart';

import '../../mocks/classMocks/external/flutter_share_mock.dart';
import '../../mocks/classMocks/usecases/fetch_phrase_usecase_mock.dart';

void main() {
  late FetchPhraseUsecase usecase;
  late HomePageController controller;
  late FlutterShareMe flutterShareMe;
  setUp(() {
    usecase = MockFetchPhraseUsecase();
    flutterShareMe = MockFlutterShare();
    controller = HomePageController(
        fetchPhraseUsecase: usecase, flutterShareMe: flutterShareMe);
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

    group("shareToWhatsApp", () {
      test("Should call shareToWhatsApp function and succed", () async {
        when(() => flutterShareMe.shareToWhatsApp(msg: any(named: "msg")))
            .thenAnswer((invocation) async => "success");
        final msg = "msg";
        await controller.shareToWhatsApp(msg);

        verify(() => flutterShareMe.shareToWhatsApp(msg: any(named: "msg")));
      });
    });
  });
}
