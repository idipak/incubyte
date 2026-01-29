import '../../../../core/error/failures.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/article_remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<(Failure?, List<Article>?)> getArticles() async {
    try {
      final remoteArticles = await remoteDataSource.getArticles();
      return (null, remoteArticles);
    } on ServerFailure catch (e) {
      return (e, null);
    } catch (e) {
      return (const ConnectionFailure('Failed to connect to the server'), null);
    }
  }
}
