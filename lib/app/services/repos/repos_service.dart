
import 'dart:async';

import 'package:my_prod_flutter_test/app/models/repos_model.dart';

abstract class ReposService {
  FutureOr<List<ReposModel>> findAll(String username);
  FutureOr<List<ReposModel>> findAllStarred(String username);
  FutureOr<int> totalCommits(String username, String repos);
}