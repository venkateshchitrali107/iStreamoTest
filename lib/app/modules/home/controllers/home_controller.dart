import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
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
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() async {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _connectionStatus = await _connectivity.checkConnectivity();
    checkforConnectivity();
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
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  checkforConnectivity() async {
    if (_connectionStatus == ConnectivityResult.none) {
      await Future.delayed(const Duration(seconds: 2));
      showSnackBar();
    }
  }

  showSnackBar() {
    Get.snackbar(
      'No Internet Connectivity',
      'Connect internet to get updated records',
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
      colorText: Colors.black,
      duration: const Duration(
        seconds: 4,
      ),
      backgroundColor: Colors.black38,
    );
  }

  _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      showSnackBar();
    }
    if (_connectionStatus != result) {
      currentPage = 1;
      isError = false;
      completed = false;
      repos.value = [];
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      getRepos();
    }
  }

  getRepos() async {
    if (completed) {
      return;
    }
    try {
      if (isLoading.isFalse) isLoading(true);
      _connectionStatus = await _connectivity.checkConnectivity();
      if (_connectionStatus == ConnectivityResult.none) {
        final offset = ((currentPage - 1) * pageSize);
        List<Repo> res = await db.getAllRepos(pageSize, offset);
        if (res.isNotEmpty) {
          List<GitResponse> currentRes = [];
          for (var rep in res) {
            currentRes.add(GitResponse.fromJson(rep.toJson()));
          }
          if (currentRes.length < 15) {
            completed = true;
          }
          repos.addAll(currentRes);
          await Future.delayed(const Duration(seconds: 3));
          currentPage = currentPage + 1;
        } else {
          completed = true;
        }
      } else {
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
          currentPage = currentPage + 1;
        } else {
          isError = true;
        }
      }
      isLoading(false);
    } catch (e) {
      isError = true;
      isLoading(false);
      printError(info: e.toString());
    }
  }
}
