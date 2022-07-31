import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {
  List<Map> vendors = [
    {
      'name': 'B. Foster\'s Bakery',
      'image': 'assets/images/bread.png',
    },
    {
      'name': 'Esther\'s Cakes',
      'image': 'assets/images/cake.png',
    },
    {
      'name': 'B. Foster\'s Bakery',
      'image': 'assets/images/cupcake.png',
    },
    {
      'name': 'Selma\'s Bakery',
      'image': 'assets/images/cookie.png',
    },
  ];
  List<Map> offers = [
    {
      'name': 'Cakes',
      'image': 'assets/images/cake.png',
      'discount': '10',
    },
    {
      'name': 'Selma\'s Cookies Giveaways',
      'image': 'assets/images/cookie.png',
      'discount': '10',
    },
    {
      'name': 'Esther\'s Cakes Promo',
      'image': 'assets/images/cupcake.png',
      'discount': '10',
    },
    {
      'name': 'Desserts',
      'image': 'assets/images/dessert.png',
      'discount': '10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     size: 35,
        //     color: Colors.black,
        //   ),
        //   onPressed: () => ,
        // ),
        elevation: 0.25,
        title: Text(
          'Offers',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subText('Scroll to see more offers from vendors'),
              const Divider(thickness: .35, color: Colors.black54),
              addVertical(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    // return OfferCard(
                    //   discount: '${offers[index]['discount']}% OFF',
                    //   image: offers[index]['image'],
                    //   title: offers[index]['name'],
                    // );
                    return Container();
                  },
                  separatorBuilder: (context, index) => addHorizontal(15),
                ),
              ),
              addVertical(size.height * 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subText('Top Vendors'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/vendors');
                    },
                    child: subText('See More'),
                  ),
                ],
              ),
              const Divider(thickness: .35, color: Colors.black54),
              addVertical(10),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // return VendorCard(
                  //   isOffersPage: true,
                  //   title: vendors[index]['name'],
                  //   image: vendors[index]['image'],
                  // );
                  return Container();
                },
                separatorBuilder: (context, index) =>
                    addVertical(size.height * 0.025),
                itemCount: vendors.length,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
