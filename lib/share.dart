// // main.dart
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
//
//
// class ShareApp extends StatelessWidget {
//   const ShareApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Matching jobs',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   final String _content =
//       ' Wellcome To matching Jobs application';
//
//   void _shareContent() {
//     Share.share(_content);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Matching Jobs'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Center(
//           child: Column(children: [
//             Text(_content),
//             const SizedBox(height: 15),
//             ElevatedButton.icon(
//                 onPressed: _shareContent,
//                 icon: const Icon(Icons.share),
//                 label: const Text('Share This Sentence'))
//           ]),
//         ),
//       ),
//     );
//   }
// }