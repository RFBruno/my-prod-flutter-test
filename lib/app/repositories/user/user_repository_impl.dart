import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_prod_flutter_test/app/core/ui/env.dart';
import 'package:my_prod_flutter_test/app/models/user_model.dart';
import 'package:my_prod_flutter_test/app/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final _dio = Dio();

  @override
  Future<UserModel> findUser(String username) async {
    try {
      final respose = await _dio.get(
        '$api/users/$username',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      return UserModel.fromMap(respose.data);
    } catch (e, s) {
      log('Error ao acessar a API user', error: e, stackTrace: s);
      throw Exception('Error ao buscar usuario');
    }
  }
}
