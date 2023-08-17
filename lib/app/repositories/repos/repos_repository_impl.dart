import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_prod_flutter_test/app/models/repos_model.dart';
import 'package:my_prod_flutter_test/app/repositories/repos/repos_repository.dart';

class ReposRepositoryImpl extends ReposRepository {
  final _dio = Dio();

  @override
  Future<List<ReposModel>> findAll(String username) async {

    try {
      final respose = await _dio.get('https://api.github.com/users/$username/repos');
      final reposList = respose.data.map<ReposModel>((repos) async {
        var reposModel = ReposModel.fromMap(repos);
        var total = await totalCommits(username, repos);
        reposModel = reposModel.copyWith(totalCommits: total);
        return reposModel;
      }).toList();
      return reposList;
    } catch (e, s) {
      log('Error ao acessar a API user', error: e, stackTrace: s);
      throw Exception('Error ao buscar repositorios');
    }
  }

  Future<int> totalCommits(String username, String repos) async {
    try {
      final respose = await _dio.get('https://api.github.com/repos/$username/$repos/commits');
      final total = respose.data.length;
      return total;
    } catch (e, s) {
      log('Error ao acessar a API user', error: e, stackTrace: s);
      throw Exception('Error ao buscar total de commits');
    }
  }
}
