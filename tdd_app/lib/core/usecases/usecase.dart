import '../error/failures.dart';

abstract class UseCase<Output, Params> {
  Future<(Failure?, Output?)> call(Params params);
}
