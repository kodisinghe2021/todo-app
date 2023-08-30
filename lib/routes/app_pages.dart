import 'package:get/get.dart';
import 'package:student_app/pages/auth_pages/login_page.dart';
import 'package:student_app/pages/auth_pages/sign_up_page.dart';
import 'package:student_app/pages/create_todo/create_todo.dart';
import 'package:student_app/pages/home/home_page.dart';
import 'package:student_app/pages/splash/splash_screen.dart';
import 'package:student_app/routes/paths.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.createtodo,
      page: () => CreateToDo(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.registration,
      page: () => SignUpPage(),
    ),
  ];
}
