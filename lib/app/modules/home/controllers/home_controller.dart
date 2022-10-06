import 'package:get/get.dart';
import '../../../data/share_pref.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  checkForUserAuth() async {
    try {
      bool isUserLoggedIn = LocalStorage().getValueFor(
            LocalStorageKeys.userLoggedIn,
          ) ??
          false;
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      if (!isUserLoggedIn) {
        Get.toNamed(Routes.AUTH);
      }
    } catch (e) {
      printError(info: e.toString());
      Get.toNamed(Routes.AUTH);
    }
  }
}
