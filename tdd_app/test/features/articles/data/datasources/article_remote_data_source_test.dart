import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_app/core/error/failures.dart';
import 'package:tdd_app/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:tdd_app/features/articles/data/models/article_model.dart';

import 'article_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ArticleRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = ArticleRemoteDataSourceImpl(dio: mockDio);
  });

  const tArticleListJson = [
    {
      "userId": 1,
      "id": 1,
      "title": "Test Title",
      "body": "Test Body"
    }
  ];

  test('should return list of ArticleModel when the response code is 200',
      () async {
    // arrange
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        data: tArticleListJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
    // act
    final result = await dataSource.getArticles();
    // assert
    expect(result, isA<List<ArticleModel>>());
    expect(result.first.id, 1);
  });

  test('should throw a ServerFailure when the response code is 404 or other',
      () async {
    // arrange
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    );
    // act
    final call = dataSource.getArticles;
    // assert
    expect(() => call(), throwsA(isA<ServerFailure>()));
  });
}
