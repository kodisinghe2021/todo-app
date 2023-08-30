// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:student_app/model/post.dart';

// class SplashScreenController extends GetxController {
//   Future<Post?> fetchData() async {
//     final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
//     Logger().i("Called 1");

//     try {
//       // send request and initialize body to response variable
//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         //return map json file to the model
//         return Post.fromJson(json.decode(response.body));
//       } else {
//         Get.snackbar(
//           "Error",
//           "Failed to load data",
//         );
//         return null;
//       }
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         e.toString(),
//       );
//       return null;
//     }
//   }
// }
