// import 'package:flutter/material.dart';
// import 'package:kintree/RouteManager/navigator_service.dart';

// class LoadingIndicatorDialog {
//   static final LoadingIndicatorDialog _singleton =
//       LoadingIndicatorDialog._internal();
//   late BuildContext _context;
//   bool isDisplayed = false;

//   factory LoadingIndicatorDialog() {
//     return _singleton;
//   }

//   LoadingIndicatorDialog._internal();

//   show({String text = 'Loading...'}) {
//     if (isDisplayed) {
//       return;
//     }
//     showDialog<void>(
//         context: appNavigator.navigationContext!,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           _context = context;
//           isDisplayed = true;
//           return WillPopScope(
//             onWillPop: () async => false,
//             child: SimpleDialog(
//               backgroundColor: Colors.white,
//               children: [
//                 Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 16, top: 16, right: 16),
//                         child: CircularProgressIndicator(),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Text(text),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   dismiss() {
//     if (isDisplayed) {
//       Navigator.of(_context).pop();
//       isDisplayed = false;
//     }
//   }
// }

// ///usage
// // LoadingIndicatorDialog().show(context);
// // await asynchronousOperation();
// // LoadingIndicatorDialog().dismiss();
// ///
