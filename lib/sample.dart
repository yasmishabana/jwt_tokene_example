// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// // import 'package:nurshas_yoga_app/widgets/build_main_button.dart';

// class CopyNumberScreen extends StatelessWidget {
//   final String number = "1234567890"; // Example number

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Copy Number')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Payment Screen",
//               style: TextStyle(
//                   fontSize: 20.0 / MediaQuery.textScaleFactorOf(context),
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             // Image.asset(
//             //   "assets/images/logo.png",
//             //   height: 150,
//             //   width: 150,
//             // ),
//             Text("Step Fit for women"),
//             Text(
//               'Number: $number',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             // InkWell(
//             //   onTap: () {
//             //     copyToClipboard(number);
//             //   },
//             //   child: BuildMainButton(
//             //       height: 50,
//             //       width: MediaQuery.of(context).size.width,
//             //       title: 'Register'),
//             // ),
//             Text(
//               "Pay this number, screenshot the transaction, and send it to Nursha on WhatsApp to confirm your course purchase.",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 15 / MediaQuery.textScaleFactorOf(context),
//                   color: Colors.black),
//             ),
//             ElevatedButton(
//               onPressed: () => copyToClipboard(number),
//               child: Text('Copy to Clipboard'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void copyToClipboard(String text) {
//     Clipboard.setData(ClipboardData(text: text)).then((_) {
//       print("Copied to clipboard: $text");
//       Get.snackbar(
//         "Copy Phone number",
//         "Pay this number, screenshot the transaction, and send it to Nursha on WhatsApp to confirm your course purchase.",
//         snackPosition: SnackPosition.TOP,
//         duration: Duration(seconds: 2),
//         // backgroundColor:
//         //     Colors.black,
//         // colorText: Colors.white,
//       );
//     });
//   }
// }