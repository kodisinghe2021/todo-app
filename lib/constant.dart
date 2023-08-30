import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

String userID = "abc";

final Uri apiUri = Uri.parse("https://jsonplaceholder.typicode.com/posts");