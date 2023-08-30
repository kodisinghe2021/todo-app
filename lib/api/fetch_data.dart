// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:student_app/model/post.dart';

// Future<Post?> fetchPost() async {
//   final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");

//   try {
//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       return Post.fromJson(json.decode(response.body));
//     } else {
//       Get.snackbar(
//         "Error",
//         "Failed to load data",
//       );
//       return null;
//     }
    
//   } catch (e) {
//     Get.snackbar(
//       "Error",
//       e.toString(),
//     );
//     return null;
//   }
// }

// Future<Post?> createPost(
//   String title,
//   String body,
// ) async {
//   Map<String, dynamic> request = {
//     'title': title,
//     'body': body,
//     'userID': '111',
//   };

//   final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/");
//   final response = await http.post(uri, body: request);

//   if (response.statusCode == 201) {
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     Get.snackbar(
//       "Error",
//       "Failed to load data",
//     );
//     return null;
//   }
// }

// Future<Post?> updatePost(String title, String body) async {
//   Map<String, dynamic> request = {
//     'id': "101",
//     'title': title,
//     'body': body,
//     'userId': '111',
//   };

//   final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
//   final response = await http.put(uri, body: request);

//   if (response.statusCode == 201) {
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     Get.snackbar(
//       "Error",
//       "Failed to load data",
//     );
//     return null;
//   }
// }

// Future<Post?> deletePost() async {
//   final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
//   final response = await http.delete(uri);

//   if (response.statusCode == 201) {
//        Get.snackbar(
//       "Success",
//       "Successfullt deleted",
//     );
//     return null;
//   } else {
//     Get.snackbar(
//       "Error",
//       "Failed to load data",
//     );
//     return null;
//   }
// }
