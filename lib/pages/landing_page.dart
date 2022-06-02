import 'package:baklavasina/pages/base_page.dart';
import 'package:baklavasina/pages/home_page.dart';
import 'package:baklavasina/pages/login_page.dart';
import 'package:baklavasina/repositories/auth_repository.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = Get.put(AuthRepository());

    return GetBuilder<AuthRepository>(builder: (_) {
      if (authRepository.user.userID != null) {
        return BasePage();
      } else {
        return LoginPage();
      }
    });
  }
}
