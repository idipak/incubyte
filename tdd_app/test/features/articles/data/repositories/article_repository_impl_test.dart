import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_app/core/error/failures.dart';
import 'package:tdd_app/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:tdd_app/features/articles/data/models/article_model.dart';
import 'package:tdd_app/features/articles/data/repositories/article_repository_impl.dart';
import 'package:tdd_app/features/articles/domain/entities/article.dart';

import 'article_repository_impl_test.mocks.dart';

@GenerateMocks([ArticleRemoteDataSource])
void main() {
  late ArticleRepositoryImpl repository;
  late MockArticleRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockArticleRemoteDataSource();
    repository = ArticleRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  const tArticleModel = ArticleModel(
    id: 1,
    userId: 1,
    title: 'Test Title',
    body: 'Test Body',
  );
  final tArticleModels = [tArticleModel];
  final List<Article> tArticles = tArticleModels;

  group('getArticles', () {
    test(
        'should return list of articles when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getArticles())
          .thenAnswer((_) async => tArticleModels);
      // act
      final result = await repository.getArticles();
      // assert
      expect(result.$2, tArticles);
      expect(result.$1, null);
      verify(mockRemoteDataSource.getArticles());
    });

    test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getArticles())
          .thenThrow(const ServerFailure('Failed to load articles'));
      // act
      final result = await repository.getArticles();
      // assert
      expect(result.$1, const ServerFailure('Failed to load articles'));
      expect(result.$2, null);
      verify(mockRemoteDataSource.getArticles());
    });
    
    test(
        'should return ConnectionFailure when a general exception occurs',
        () async {
      // arrange
      when(mockRemoteDataSource.getArticles())
          .thenThrow(Exception());
      // act
      final result = await repository.getArticles();
      // assert
      expect(result.$1, const ConnectionFailure('Failed to connect to the server'));
      expect(result.$2, null);
      verify(mockRemoteDataSource.getArticles());
    });
  });
}
