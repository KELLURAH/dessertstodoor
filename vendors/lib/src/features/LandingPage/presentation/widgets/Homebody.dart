import 'package:flutter/material.dart';

import '../../../../../core/components/dashCards.dart';
import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';

GestureDetector HomeBody(
    BuildContext context,
    Size size,
    TextEditingController searchController,
    void runFilter(String enteredKeyword),
    List<Map<dynamic, dynamic>> products,
    List<Map<dynamic, dynamic>> vendors) {
  return GestureDetector(
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
              onChanged: () => runFilter(searchController.text),
            ),
            addVertical(20),
            subText(
              'Add Products',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            const Divider(thickness: .45, color: Colors.black54),
            addVertical(10),
            SizedBox(
              height: size.height * 0.15,
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
            subText(
              'Vendors',
              fontWeight: FontWeight.w600,
              fontSize: 18,
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
                  itemCount: vendors.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container();
                    // return GestureDetector(
                    //   onTap: () {
                    //     // TODO Details about vendor, adding to cart
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Vendors(
                    //             vendorName: _vendors[index]['name'],
                    //             vendorImage: _vendors[index]['image'],
                    //             fromHomepage: false,
                    //           ),
                    //         ));
                    //   },
                    //   child: VendorCard(
                    //     isOffersPage: false,
                    //     title: _vendors[index]['name'],
                    //     image: _vendors[index]['image'],
                    //   ),
                    // );
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
  );
}
