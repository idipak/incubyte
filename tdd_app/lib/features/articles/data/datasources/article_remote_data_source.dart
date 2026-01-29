import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../models/article_model.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;

  ArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getArticles() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => ArticleModel.fromJson(e))
            .toList();
      } else {
        throw const ServerFailure('Failed to load articles');
      }
    } catch (e) {
      throw const ServerFailure('Failed to load articles');
    }
  }
}
