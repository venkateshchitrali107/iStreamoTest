import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:i_streamo_test/app/Utils/Styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
          if (controller.isError && controller.repos.length == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Failed to get repos",
                  style: getMobileRegularTextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }
          return ScrollablePositionedList.builder(
            itemCount: controller.repos.length +
                (controller.isLoading.isTrue
                    ? 1
                    : controller.isError
                        ? 1
                        : 0),
            itemScrollController: controller.itemScrollController,
            itemPositionsListener: controller.itemPositionsListener,
            itemBuilder: ((context, index) {
              if (controller.isLoading.isTrue &&
                  index == controller.repos.length) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (controller.isError &&
                  index == controller.repos.length) {
                return Text("Failed to get new Respos");
              } else {
                return GitCardView(controller.repos[index]);
              }
            }),
          );
        },
      ),
    );
  }
}
