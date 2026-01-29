import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/features/articles/data/models/article_model.dart';
import 'package:tdd_app/features/articles/domain/entities/article.dart';

void main() {
  const tArticleModel = ArticleModel(
    id: 1,
    userId: 1,
    title: 'Test Title',
    body: 'Test Body',
    isBookmarked: true,
  );

  test('should be a subclass of Article entity', () async {
    expect(tArticleModel, isA<Article>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = {
          "userId": 1,
          "id": 1,
          "title": "Test Title",
          "body": "Test Body",
          "isBookmarked": true,
        };
        // act
        final result = ArticleModel.fromJson(jsonMap);
        // assert
        expect(result, tArticleModel);
      },
    );
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // act
      final result = tArticleModel.toJson();
      // assert
      final expectedMap = {
        "userId": 1,
        "id": 1,
        "title": "Test Title",
        "body": "Test Body",
        "isBookmarked": true,
      };
      expect(result, expectedMap);
    });
  });
}
