// static const home = '/';
// static const splash = '/splash';
// static const login = '/login';
// static const createtodo = '/createtodo';
// static const registration = '/registration';

import 'package:get/get.dart';
import 'package:student_app/pages/create_todo/create_todo.dart';
import 'package:student_app/pages/home/home_page.dart';
import 'package:student_app/routes/paths.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () =>  HomePage(),
    ),
    GetPage(
      name: Routes.createtodo,
      page: () => CreateToDo(),
    ),
  ];
}
