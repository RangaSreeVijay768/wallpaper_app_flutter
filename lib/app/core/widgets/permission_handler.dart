// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';
//
// Future<bool> requestPermissions() async {
//   if (Platform.isAndroid) {
//     // Handle storage permissions
//     bool isStoragePermissionGranted = false;
//
//     if (await Permission.manageExternalStorage.isGranted ||
//         await Permission.storage.isGranted) {
//       isStoragePermissionGranted = true;
//     } else if (await Permission.manageExternalStorage.request().isGranted ||
//         await Permission.storage.request().isGranted) {
//       isStoragePermissionGranted = true;
//     }
//
//     if (!isStoragePermissionGranted) {
//       return false; // Storage permission denied
//     }
//
//     // Handle location permissions
//     bool isLocationPermissionGranted = false;
//
//     if (await Permission.location.isGranted) {
//       isLocationPermissionGranted = true;
//     } else if (await Permission.location.request().isGranted) {
//       isLocationPermissionGranted = true;
//     }
//
//     if (!isLocationPermissionGranted) {
//       return false; // Location permission denied
//     }
//
//     // Handle notification permissions (Android 13+)
//     // if (Platform.isAndroid && await Permission.notification.isGranted) {
//     //   // Notification permission already granted
//     // } else if (await Permission.notification.request().isGranted) {
//     //   // Notification permission granted
//     // } else {
//     //   return false; // Notification permission denied
//     // }
//
//     return true; // All required permissions granted
//   }
//
//   return false; // Permissions not required on non-Android platforms
// }
