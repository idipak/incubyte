import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_articles.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticles getArticles;

  ArticleBloc({required this.getArticles}) : super(ArticleInitial()) {
    on<FetchArticles>((event, emit) async {
      emit(ArticleLoading());
      final result = await getArticles(NoParams());

      final failure = result.$1;
      final articles = result.$2;

      if (failure != null) {
        emit(ArticleError(failure.message));
      } else if (articles != null) {
        emit(ArticleLoaded(articles));
      } else {
        emit(const ArticleError('Unexpected error'));
      }
    });
  }
}
