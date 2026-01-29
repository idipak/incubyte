import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticles extends ArticleEvent {}

class BookmarkArticle extends ArticleEvent {
  final int articleId;

  const BookmarkArticle(this.articleId);

  @override
  List<Object> get props => [articleId];
}
