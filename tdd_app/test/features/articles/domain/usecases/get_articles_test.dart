import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_app/features/articles/domain/entities/article.dart';
import 'package:tdd_app/features/articles/domain/repositories/article_repository.dart';
import 'package:tdd_app/features/articles/domain/usecases/get_articles.dart';

import 'get_articles_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  late GetArticles usecase;
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    usecase = GetArticles(mockArticleRepository);
  });

  const tArticles = [
    Article(id: 1, userId: 1, title: 'Test Title 1', body: 'Test Body 1'),
    Article(id: 2, userId: 1, title: 'Test Title 2', body: 'Test Body 2'),
  ];

  test('should get list of articles from the repository', () async {
    // arrange
    when(mockArticleRepository.getArticles())
        .thenAnswer((_) async => (null, tArticles));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, (null, tArticles));
    verify(mockArticleRepository.getArticles());
    verifyNoMoreInteractions(mockArticleRepository);
  });
}
