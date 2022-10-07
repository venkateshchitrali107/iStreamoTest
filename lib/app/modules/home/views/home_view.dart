import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'git_card_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jake's Git",
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.repos.length,
            itemBuilder: ((context, index) {
              return GitCardView(controller.repos.value[index]);
            }),
          );
        },
      ),
    );
  }
}
