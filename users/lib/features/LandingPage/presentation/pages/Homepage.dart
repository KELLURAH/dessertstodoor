import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';
import 'package:users/features/Vendors/presentation/widgets/VendorCard.dart';

import '../../../../core/components/dashCards.dart';
import '../../../../core/components/widgetFunctions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchController = TextEditingController();

    List<Map> products = [
      {
        'title': 'Cakes',
        'image': 'assets/images/cake.png',
        'color': PRIMARY_COLOR,
      },
      {
        'title': 'Cookies',
        'image': 'assets/images/cookie.png',
        'color': SECOND_COLOR,
      },
      {
        'title': 'Cup Cakes',
        'image': 'assets/images/cupcake.png',
        'color': OFFERS_COLOR,
      },
      {
        'title': 'Desserts',
        'image': 'assets/images/dessert.png',
        'color': Colors.green
      },
    ];
    List<Map> _vendors = [
      {
        'name': 'Tom\'s Bakery',
        'specialty': 'Bread, Cakes',
        'image': 'assets/images/cupcake.png'
      },
      {
        'name': 'B. Foster\'s Bakery',
        'specialty': 'Bread',
        'image': 'assets/images/cookie.png'
      },
      {
        'name': 'Tom\'s Bakery',
        'specialty': 'Bread',
        'image': 'assets/images/cookie.png'
      },
      {
        'name': 'Tom\'s Bakery',
        'specialty': 'Bread',
        'image': 'assets/images/cake.png'
      },
    ];
    final scrollController = ScrollController();
    return Scaffold(
      // drawer: Sidebar(),
      appBar: appbar(
        true,
        title: 'Home',
        backgroundColor: SECOND_COLOR,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: BACKGROUND_COLOR),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Welcome, ${widget.name}',
                //   style: GoogleFonts.poppins(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w500,
                //     color: Colors.black,
                //   ),
                // ),
                // const Divider(),
                addVertical(10),
                buildTextFormField('Search for Pastries', 'Search',
                    searchController, true, SECOND_COLOR.withOpacity(0.35)),
                addVertical(20),
                Text(
                  'Our Products ',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Divider(thickness: .45, color: Colors.black54),
                // addVertical(10),
                // buildTextFormField(
                //   'Search for Pastries',
                //   'Search',D
                //   searchController,
                // ),
                addVertical(10),
                SizedBox(
                  height: size.height * 0.2,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ProfileCard(
                          title: products[index]['title'],
                          subtitle: '',
                          image: products[index]['image'],
                          backgroundColor: products[index]['color'],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => addHorizontal(15),
                  ),
                ),
                addVertical(20),
                Text(
                  'Top Vendors',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Divider(thickness: .45, color: Colors.black54),
                Container(
                  height: size.height * 0.55,
                  child: Scrollbar(
                    thickness: 6,
                    radius: const Radius.circular(15),
                    thumbVisibility: false,
                    // controller: scrollController,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: _vendors.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return VendorCard(
                          title: _vendors[index]['name'],
                          image: _vendors[index]['image'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return addVertical(15);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
