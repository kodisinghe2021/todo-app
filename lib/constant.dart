import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

String userID = "abc";

const String apiUri = "https://jsonplaceholder.typicode.com/posts/";

//--------- colors
Color kLight() => const Color(0xffffffff);
Color kh1() => const Color(0xff2e3e5c);
Color kh3() => const Color(0xFF9fa5c0);
Color kbuttonPrimer() => const Color(0xff1fcc79);
Color kicon() => const Color(0xff485670);
Color kredbtn() => const Color(0xffff5842);
Color kWarning() => const Color(0xffB9B4C7);
Color kSuccess() => const Color(0xff00DFA2);
Color kError() => const Color(0xffFF0060);
Color kDark() => const Color(0xff000000);
Color kBackGray() => const Color(0xffe6e4e0);
Color kPolyline() => const Color(0xfffcd34d);
Color fontBlue() => const Color(0xff3e5481);
