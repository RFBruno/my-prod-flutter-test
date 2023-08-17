import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_prod_flutter_test/app/core/ui/env.dart';
import 'package:my_prod_flutter_test/app/models/repos_model.dart';
import 'package:my_prod_flutter_test/app/repositories/repos/repos_repository.dart';

class ReposRepositoryImpl extends ReposRepository {
  final _dio = Dio();

  @override
  Future<List<ReposModel>> findAll(String username) async {
    try {
      final respose = await _dio.get(
        '$api/users/$username/repos',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      final reposList = respose.data.map<ReposModel>((repos){
        return ReposModel.fromMap(repos);
      }).toList();
      return reposList;
    } catch (e, s) {
      log('Error ao acessar a API repos', error: e, stackTrace: s);
      throw Exception('Error ao buscar repositorios');
    }
  }
  
  @override
  FutureOr<List<ReposModel>> findAllStarred(String username) async {
    try {
      final respose = await _dio.get(
        '$api/users/$username/starred',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      final reposList = respose.data.map<ReposModel>((repos){
        return ReposModel.fromMap(repos);
      }).toList();
      return reposList;
    } catch (e, s) {
      log('Error ao acessar a API repos', error: e, stackTrace: s);
      throw Exception('Error ao buscar repositorios');
    }
  }

  Future<int> totalCommits(String username, String repos) async {
    try {
      final respose = await _dio.get(
        '$api/repos/$username/$repos/commits',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      final total = respose.data.length;
      return total;
    } catch (e, s) {
      log('Error ao acessar a API user', error: e, stackTrace: s);
      throw Exception('Error ao buscar total de commits');
    }
  }
}
