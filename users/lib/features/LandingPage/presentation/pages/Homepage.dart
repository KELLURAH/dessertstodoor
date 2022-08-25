import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';
import 'package:users/features/Vendors/presentation/widgets/VendorCard.dart';

import '../../../../core/components/dashCards.dart';
import '../../../../core/components/widgetFunctions.dart';
import '../../../Vendors/presentation/pages/SeeMoreVendors.dart';

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
    List _foundUsers = [];
    List<Map> products = [
      {
        'title': 'Cakes',
        'image': 'assets/images/cake.png',
        'color': PRIMARY_COLOR,
        'filter': 'cakes'
      },
      {
        'title': 'Cookies',
        'image': 'assets/images/cookie.png',
        'color': SECOND_COLOR,
        'filter': 'cookies'
      },
      {
        'title': 'Cup Cakes',
        'image': 'assets/images/cupcake.png',
        'color': OFFERS_COLOR,
        'filter': 'cupcakes'
      },
      {
        'title': 'Desserts',
        'image': 'assets/images/dessert.png',
        'color': Colors.green,
        'filter': 'desserts'
      },
    ];
    List<Map<dynamic, dynamic>> _allPastries = products;
    void _runFilter(String enteredKeyword) {
      List<Map<String, dynamic>>? results = [];
      if (enteredKeyword.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = _allPastries.cast<Map<String, dynamic>>();
      } else {
        results = _allPastries
            .where((user) => user['filter']
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .cast<Map<String, dynamic>>()
            .toList();
        // we use the toLowerCase() method to make it case-insensitive
      }
      setState(() {
        _foundUsers = results!;
      });
    }

    List<Map> vendors = [
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
    // final scrollController = ScrollController();
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
                addVertical(10),
                buildTextFormField(
                  'Search for Pastries',
                  'Search',
                  searchController,
                  true,
                  SECOND_COLOR.withOpacity(0.35),
                  onChanged: () => _runFilter(searchController.text),
                ),
                addVertical(20),
                subText('Categories'),
                const Divider(thickness: .45, color: Colors.black54),
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
                subText('Vendors'),
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
                      itemCount: vendors.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // TODO Details about vendor, adding to cart
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Vendors(
                                    vendorName: vendors[index]['name'],
                                    vendorImage: vendors[index]['image'],
                                    fromHomepage: false,
                                  ),
                                ));
                          },
                          child: VendorCard(
                            isOffersPage: false,
                            title: vendors[index]['name'],
                            image: vendors[index]['image'],
                          ),
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
