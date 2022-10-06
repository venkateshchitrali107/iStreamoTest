import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../Utils/Styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.checkForUserAuth();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image(
                image: AssetImage("asset/github.png"),
                width: Get.width * 0.6,
              ),
            ),
            Text(
              'iStreamo',
              style: getMobileRegularTextStyle(
                fontSize: 30,
              ).copyWith(
                color: Get.theme.primaryColor,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
