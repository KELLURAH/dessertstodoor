// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../../../core/components/dashCards.dart';
// import '../../../../../core/components/widgetFunctions.dart';
// import '../../../../../core/utils/Colors.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final searchController = TextEditingController();
//     List foundUsers = [];
//     List<Map> products = [
//       {
//         'title': 'Cakes',
//         'image': 'assets/images/cake.png',
//         'color': PRIMARY_COLOR,
//         'filter': 'cakes'
//       },
//       {
//         'title': 'Cookies',
//         'image': 'assets/images/cookie.png',
//         'color': SECOND_COLOR,
//         'filter': 'cookies'
//       },
//       {
//         'title': 'Cup Cakes',
//         'image': 'assets/images/cupcake.png',
//         'color': OFFERS_COLOR,
//         'filter': 'cupcakes'
//       },
//       {
//         'title': 'Desserts',
//         'image': 'assets/images/dessert.png',
//         'color': Colors.green,
//         'filter': 'desserts'
//       },
//     ];
//     List<Map<dynamic, dynamic>> allPastries = products;
//     void _runFilter(String enteredKeyword) {
//       List<Map<String, dynamic>>? results = [];
//       if (enteredKeyword.isEmpty) {
//         // if the search field is empty or only contains white-space, we'll display all users
//         results = allPastries.cast<Map<String, dynamic>>();
//       } else {
//         results = allPastries
//             .where((user) => user['filter']
//                 .toLowerCase()
//                 .contains(enteredKeyword.toLowerCase()))
//             .cast<Map<String, dynamic>>()
//             .toList();
//         // we use the toLowerCase() method to make it case-insensitive
//       }
//       setState(() {
//         foundUsers = results!;
//       });
//     }

//     List<Map> vendors = [
//       {
//         'name': 'Tom\'s Bakery',
//         'specialty': 'Bread, Cakes',
//         'image': 'assets/images/cupcake.png'
//       },
//       {
//         'name': 'B. Foster\'s Bakery',
//         'specialty': 'Bread',
//         'image': 'assets/images/cookie.png'
//       },
//       {
//         'name': 'Tom\'s Bakery',
//         'specialty': 'Bread',
//         'image': 'assets/images/cookie.png'
//       },
//       {
//         'name': 'Tom\'s Bakery',
//         'specialty': 'Bread',
//         'image': 'assets/images/cake.png'
//       },
//     ];
//     final scrollController = ScrollController();
//     return Scaffold(
//       // drawer: Sidebar(),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // leading: IconButton(
//         //   icon: const Icon(
//         //     Icons.menu,
//         //     size: 35,
//         //     color: Colors.black,
//         //   ),
//         //   onPressed: () => ,
//         // ),
//         elevation: 0.25,
//         title: Text(
//           'Homepage',
//           style: GoogleFonts.poppins(
//             color: Colors.black,
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: HomeBody(
//           context, size, searchController, _runFilter, products, vendors),
//     );
//   }

  
// }
