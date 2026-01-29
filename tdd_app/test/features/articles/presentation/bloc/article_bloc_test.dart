import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_app/core/error/failures.dart';
import 'package:tdd_app/features/articles/domain/entities/article.dart';
import 'package:tdd_app/features/articles/domain/usecases/get_articles.dart';
import 'package:tdd_app/features/articles/presentation/bloc/article_bloc.dart';
import 'package:tdd_app/features/articles/presentation/bloc/article_event.dart';
import 'package:tdd_app/features/articles/presentation/bloc/article_state.dart';

import 'article_bloc_test.mocks.dart';

@GenerateMocks([GetArticles])
void main() {
  late ArticleBloc bloc;
  late MockGetArticles mockGetArticles;

  setUp(() {
    mockGetArticles = MockGetArticles();
    bloc = ArticleBloc(getArticles: mockGetArticles);
  });

  test('initial state should be ArticleInitial', () {
    expect(bloc.state, equals(ArticleInitial()));
  });

  const tArticles = [
    Article(id: 1, userId: 1, title: 'Test Title 1', body: 'Test Body 1'),
  ];

  blocTest<ArticleBloc, ArticleState>(
    'should emit [ArticleLoading, ArticleLoaded] when data is gotten successfully',
    build: () {
      when(mockGetArticles(any)).thenAnswer((_) async => (null, tArticles));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchArticles()),
    expect: () => [ArticleLoading(), const ArticleLoaded(tArticles)],
  );

  blocTest<ArticleBloc, ArticleState>(
    'should emit [ArticleLoading, ArticleError] when getting data fails',
    build: () {
      when(
        mockGetArticles(any),
      ).thenAnswer((_) async => (const ServerFailure('Server Failure'), null));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchArticles()),
    expect: () => [ArticleLoading(), const ArticleError('Server Failure')],
  );

  blocTest<ArticleBloc, ArticleState>(
    'should toggle selection status of article',
    build: () {
      when(mockGetArticles(any)).thenAnswer((_) async => (null, tArticles));
      return bloc;
    },
    act: (bloc) async {
      bloc.add(FetchArticles());
      await Future.delayed(Duration.zero);
      bloc.add(const BookmarkArticle(1));
    },
    expect: () => [
      ArticleLoading(),
      const ArticleLoaded(tArticles),
      ArticleLoaded([tArticles[0].copyWith(isBookmarked: true)]),
    ],
  );
}
