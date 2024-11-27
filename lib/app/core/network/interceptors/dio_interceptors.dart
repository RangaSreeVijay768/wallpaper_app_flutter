// import 'dart:async';
// import 'dart:convert';
//
// import 'package:basic/app/core/logger/log.dart';
// import 'package:basic/app/user_accounts/models/users/user_account.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class EScaleInterceptors extends InterceptorsWrapper {
//   @override
//   FutureOr<dynamic> onRequest(RequestOptions options,
//       RequestInterceptorHandler handler) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? user = prefs.getString("user");
//     // logger.d(user);
//     if (user != null) {
//       UserAccount userAccount =
//           UserAccount.fromJson(jsonDecode(user));
//       // logger.d(userAccount.accessToken);
//       options.headers["x-access-token"] = userAccount.accessToken;
//     }
//
//     return handler.next(options);
//   }
//
//   @override
//   void onResponse(
//       Response<dynamic> response, ResponseInterceptorHandler handler) {
//     dynamic object = response.data;
//     if (object is String) {
//       if (object.startsWith("\"")) {
//         response.data = object.substring(1, object.length - 1);
//       }
//     }
//     return handler.next(response);
//   }
// }
