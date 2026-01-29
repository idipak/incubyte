import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;
  final bool isBookmarked;

  const Article({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [id, userId, title, body, isBookmarked];
}
