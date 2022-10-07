import 'dart:convert';

import 'package:get/get.dart';
import 'package:i_streamo_test/app/data/api_constants.dart';
import 'package:i_streamo_test/app/modules/home/model/git_response.dart';

class HomeController extends GetxController {
  RxList repos = [].obs;
  @override
  void onInit() {
    super.onInit();
    getRepos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getRepos() async {
    try {
      final res = await BaseApiServices.get(APIConstants.baseUrl);
      List decoded = json.decode(res?.body ?? '');
      List<GitResponse> currentRes = [];
      for (var rep in decoded) {
        currentRes.add(GitResponse.fromJson(rep));
      }
      repos.addAll(currentRes);
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
