// 6. showdialog after loading page
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// //   @override
// //  Widget build(BuildContext context) {
// if (permissions[Permission.bluetoothConnect] == PermissionStatus.denied ||
//         permissions[Permission.bluetoothConnect] == PermissionStatus.permanentlyDenied) {
//       Future.delayed(
//         const Duration(milliseconds: 500),
//         () => showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) => CupertinoAlertDialog(
//             title: const Text('Bluetooth Connect'),
//             content: const Text('To read data from scale bluetooth connect permission is necessary!'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => openAppSettings(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
