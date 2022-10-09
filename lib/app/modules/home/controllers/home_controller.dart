import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/localDB/db.dart';
import '../../../data/api_constants.dart';
import '../model/git_response.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController {
  RxList repos = [].obs;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int pageSize = 15;
  bool isError = false;
  bool completed = false;
  MyDatabase db = Get.find();

  @override
  void onInit() {
    super.onInit();
    getRepos();
  }

  @override
  void onReady() {
    super.onReady();
    itemPositionsListener.itemPositions.addListener(
      () async {
        if (itemPositionsListener.itemPositions.value.last.index >
            (repos.length - 2)) {
          if (isLoading.isFalse) {
            getRepos();
            await Future.delayed(
              const Duration(
                seconds: 2,
              ),
            );
          }
        }
      },
    );
  }

  @override
  void onClose() {}

  getRepos() async {
    if (completed) {
      return;
    }
    try {
      isLoading(true);
      final res = await BaseApiServices.get(
        "repos?page=$currentPage&per_page=$pageSize",
      );
      if (res != null && res.statusCode == 200) {
        var decoded = json.decode(res.body);
        if (currentPage == 1) {
          repos.value = [];
          db.deleteAllRepos();
        }
        List<GitResponse> currentRes = [];
        for (var rep in decoded) {
          currentRes.add(GitResponse.fromJson(rep));
          await db.insertRepo(Repo.fromJson(rep));
        }
        if (currentRes.length < 15) {
          completed = true;
        }
        repos.addAll(currentRes);
        final offset = ((currentPage - 1) * pageSize);
        var reposActive = await db.getAllRepos(pageSize, offset);
        currentPage = currentPage + 1;
      } else {
        isError = true;
      }
      isLoading(false);
    } catch (e) {
      isError = true;
      isLoading(false);
      printError(info: e.toString());
    }
  }
}
