import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/articles/data/datasources/article_remote_data_source.dart';
import 'features/articles/data/repositories/article_repository_impl.dart';
import 'features/articles/domain/repositories/article_repository.dart';
import 'features/articles/domain/usecases/get_articles.dart';
import 'features/articles/presentation/bloc/article_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ArticleBloc(getArticles: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetArticles(sl()));

  // Repository
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSourceImpl(dio: sl()),
  );

  // External
  sl.registerLazySingleton(() => Dio());
}
