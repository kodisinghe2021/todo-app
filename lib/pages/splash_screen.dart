// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:student_app/constant.dart';
// import 'package:student_app/controllers/spla.dart';
// import 'package:student_app/model/post.dart';

// class SplashScreen extends StatelessWidget {
//   SplashScreen({super.key});

//   final SplashScreenController _getXController =
//       Get.put<SplashScreenController>(SplashScreenController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: getScreenSize(context).width,
//         height: getScreenSize(context).height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("data"),
//             FutureBuilder<Post?>(
//               future: _getXController.fetchData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.connectionState == ConnectionState.none) {
//                   return const Text("No Data");
//                 }

//                 if (snapshot.hasData) {
//                   return Text(snapshot.data!.title);
//                 }
//                 return const Text("Somthing went wrong");
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           Map<String, dynamic> request = {
//             'title': "titleLarge",
//             'discription': "discription",
//             'userID': '111',
//             'token': 'abc123',
//           };

//           Logger().i("clicked");

//           final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

//           final response = await http.post(uri, body: request);
//           Logger().i("response code -- ${response.statusCode}");
//           if (response.statusCode == 201) {
//             Logger().i("Created");
//             Logger().i("Body - ${response.body}");
//           } else {
//             Get.snackbar(
//               "Error",
//               "Failed to load data --> ${response.statusCode}",
//             );
//           }
//         },
//         child: const Icon(Icons.get_app),
//       ),
//     );
//   }
// }
