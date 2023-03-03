// import 'package:dalaalapp/model/house.dart';
// import 'package:dalaalapp/screen/detail/widget/content_intro.dart';
// import 'package:dalaalapp/screen/detail/widget/detail_app_bar.dart';
// import 'package:dalaalapp/screen/detail/widget/house_info.dart';
// import 'package:flutter/material.dart';
//
// import '../home/widget/orderderRecomended.dart';
// import 'about.dart';
// import 'dalab.dart';
//
// class DetailPage extends StatefulWidget {
//   final House house;
//
//   const DetailPage({Key? key, required this.house}) : super(key: key);
//
//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   final recomendedList = House.generatedRecomended();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DetailAppBar(house: widget.house),
//             SizedBox(height: 20),
//             ContentIntro(house: widget.house),
//             SizedBox(height: 20),
//             HouseInfo(),
//             SizedBox(height: 20),
//             AboutPage(),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (builder)=>OrderedRecommended()));
//
//
//                   },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   primary: Theme.of(context).primaryColor,
//                 ),
//                 child: Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   child: Text(
//                     "Order Now",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
