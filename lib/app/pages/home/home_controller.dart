import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  var reposListFiltered = <ReposModel>[].obs;
  var starredList = <ReposModel>[].obs;
  var starredListFiltered = <ReposModel>[].obs;

  final _userService = UserServiceImpl();
  final _reposService = ReposServiceImpl();

  Future<void> toLoadInformations() async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    var response = await _userService.findUser(username);
    name.value = response.name;
    avatar.value = response.avatar_url;
    bio.value = response.bio;

    await toLoadRepos();
    await toLoadStarred();
    EasyLoading.dismiss();
  }

  Future<void> toLoadRepos() async {
    var response = await _reposService.findAll(username);
    reposList.value = response.map((repos) => repos).toList();
    reposListFiltered.value = reposList;
  }

  Future<void> toLoadStarred() async {
    var response = await _reposService.findAllStarred(username);
    starredList.value = response.map((repos) => repos).toList();
    starredListFiltered.value = starredList;
  }

  void filterRepos(String input, [bool starred = false]) {
    if (starred) {
      starredListFiltered.value = starredList;
      if (input.isNotEmpty) {
        starredListFiltered.value = starredListFiltered
            .where((repos) =>
                repos.name.toUpperCase().contains(input.toUpperCase()))
            .toList();
      }
    } else {
      reposListFiltered.value = reposList;
      if (input.isNotEmpty) {
        reposListFiltered.value = reposListFiltered
            .where((repos) =>
                repos.name.toUpperCase().contains(input.toUpperCase()))
            .toList();
      }
    }
  }
}
