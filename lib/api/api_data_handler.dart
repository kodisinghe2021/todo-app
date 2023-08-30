// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:student_app/model/post.dart';

// class APIDataHanlder {
//   String apiUrl = "https://jsonplaceholder.typicode.com/todos/";

//   Future<Post?> fetchPost() async {
//     final uri = Uri.parse(apiUrl);

//     try {
//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
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
