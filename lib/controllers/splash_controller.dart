import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:student_app/api/user_status.dart';
import 'package:student_app/routes/paths.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    await move();
    super.onReady();
  }

  final LocalUserStatus _userStatus = LocalUserStatus();

  Future<void> move() async {
    Logger().i("Inside move()");

    bool islogged = _userStatus.isUserLogged();

    Logger().i("Get Storage readed");

    if (islogged) {
      Logger().i("To home");
      Future.delayed(
        const Duration(milliseconds: 3000),
        () => Get.offAllNamed(Routes.home),
      );
    } else {
      Logger().i("To lgin");
      Future.delayed(
        const Duration(milliseconds: 3000),
        () => Get.offAllNamed(Routes.login),
      );
    }
  }
}
