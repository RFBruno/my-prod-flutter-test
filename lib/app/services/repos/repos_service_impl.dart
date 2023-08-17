import 'dart:async';

import 'package:my_prod_flutter_test/app/models/repos_model.dart';
import 'package:my_prod_flutter_test/app/repositories/repos/repos_repository_impl.dart';
import 'package:my_prod_flutter_test/app/services/repos/repos_service.dart';

class ReposServiceImpl extends ReposService {
  final _repository = ReposRepositoryImpl();
  @override
  FutureOr<List<ReposModel>> findAll(String username) =>
      _repository.findAll(username);

  @override
  FutureOr<List<ReposModel>> findAllStarred(String username) =>
      _repository.findAllStarred(username);

  @override
  FutureOr<int> totalCommits(String username, String repos) =>
      _repository.totalCommits(username, repos);
}
