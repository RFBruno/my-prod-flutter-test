

import 'dart:async';

import 'package:my_prod_flutter_test/app/models/user_model.dart';

abstract class UserService {
  FutureOr<UserModel> findUser(String username);
}
