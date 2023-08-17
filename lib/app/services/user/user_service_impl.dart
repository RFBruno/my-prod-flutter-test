import 'dart:async';
import 'package:my_prod_flutter_test/app/models/user_model.dart';
import 'package:my_prod_flutter_test/app/repositories/user/user_repository_impl.dart';
import 'package:my_prod_flutter_test/app/services/user/user_service.dart';


class UserServiceImpl extends UserService {
  final _repository = UserRepositoryImpl();

  @override
  Future<UserModel> findUser(String username) => _repository.findUser(username);
}
