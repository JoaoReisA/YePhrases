import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ye_phrases/data/repository/ye_phrase_repository_impl.dart';

import '../../data/datasources/ye_phrases_remote_datasource.dart';
import '../../domain/repository/ye_phrase_repository.dart';
import '../../domain/usecases/fetch_pharase_usecase.dart';

GetIt locator = GetIt.instance;

class Locator {
  static void injectDependencies() {
    locator.registerSingleton<Dio>(Dio());

    locator.registerFactory<YePhrasesRemoteDataSource>(
        () => YePhrasesRemoteDataSourceImpl(client: locator<Dio>()));

    locator.registerFactory<YePhraseRepository>(() => YePhraseRepositoryImpl(
        remoteDataSource: locator<YePhrasesRemoteDataSource>()));

    locator.registerFactory<FetchPhraseUsecase>(() =>
        FetchPhraseUsecaseImpl(repository: locator<YePhraseRepository>()));
  }
}
