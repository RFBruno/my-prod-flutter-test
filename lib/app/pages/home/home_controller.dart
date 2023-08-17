import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_prod_flutter_test/app/models/repos_model.dart';
import 'package:my_prod_flutter_test/app/services/repos/repos_service_impl.dart';
import 'package:my_prod_flutter_test/app/services/user/user_service_impl.dart';

class HomeController extends GetxController {
  var username = 'RFBruno';
  var name = ''.obs;
  var avatar = ''.obs;
  var bio = ''.obs;
  var reposList = <ReposModel>[].obs;

  final _userService = UserServiceImpl();
  final _reposService = ReposServiceImpl();

  Future<void> toLoadInformations() async {
    var response = await _userService.findUser(username);
    name.value = response.name;
    avatar.value = response.avatar_url;
    bio.value = response.bio;

    toLoadRepos();
  }

  Future<void> toLoadRepos() async {
    var response = await _reposService.findAll(username);
    reposList.value = response.map((repos) => repos).toList();
  }
}
