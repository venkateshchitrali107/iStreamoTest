import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../Utils/screen_util.dart';
import '../../../Utils/size_extension.dart';
import '../../../Utils/Styles.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
                width: 0.6.sw,
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
            SizedBox(
              height: 20,
            ),
            Obx(
              () {
                return AnimatedOpacity(
                  opacity: controller.showLogin.value ? 1 : 0,
                  curve: Curves.easeInOut,
                  duration: Duration(seconds: 3),
                  child: controller.isBiometricsSupported
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Get.theme.primaryColorDark,
                            ),
                          ),
                          onPressed: () {
                            controller.signInWithBiometrics();
                          },
                          child: Text(
                            'Login',
                            style: getMobileRegularTextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : Text(
                          'Oops, device does not support biometrics',
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: Get.theme.errorColor,
                          ),
                        ),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
