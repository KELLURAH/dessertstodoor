import 'package:dropdown_search/dropdown_search.dart';
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
  List<Map> offers = [
    {
      'name': 'Anniversary',
      'image': 'assets/images/cake.png',
      'discount': '1200',
    },
    {
      'name': 'Birthday Promo Giveaways',
      'image': 'assets/images/cookie.png',
      'discount': '1000',
    },
    {
      'name': 'Family Promo',
      'image': 'assets/images/cupcake.png',
      'discount': '2500',
    },
    {
      'name': 'Desserts',
      'image': 'assets/images/dessert.png',
      'discount': '1250',
    },
    {
      'name': 'Picnics',
      'image': 'assets/images/dessert.png',
      'discount': '1700',
    },
    {
      'name': 'Romantic',
      'image': 'assets/images/dessert.png',
      'discount': '2500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.amberAccent.withOpacity(0.15),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.warning_amber_outlined,
                      color: Colors.amberAccent,
                    ),
                    addHorizontal(size.width * 0.025),
                    subText(
                      'Only two offers can be created per vendor...',
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: .35, color: Colors.black54),
              addVertical(10),
              SingleChildScrollView(
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            subText('Add Package as Offer', fontSize: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: true,
                                      disabledItemFn: (String s) {
                                        return s.startsWith('Co') ||
                                            s.startsWith('D') ||
                                            s.startsWith('P');
                                      },
                                    ),
                                    items: const [
                                      'Anniversary',
                                      'Cookies (Coming Soon...)',
                                      'Birthday',
                                      'Desserts (Coming Soon...)',
                                      'Family',
                                      'Picnics (Coming Soon...)',
                                    ],
                                    // items: offers[index]['name'],

                                    onChanged: print,
                                    selectedItem: 'Add Package',
                                  ),
                                ),
                                addHorizontal(10),
                                Expanded(
                                  child: DropdownSearch<String>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: false,
                                      ),
                                      items: [
                                        'GH¢ ${double.parse('1000.00').toStringAsFixed(2)}',
                                        'GH¢ ${double.parse('1200.00').toStringAsFixed(2)}',
                                        'GH¢ ${double.parse('1250.00').toStringAsFixed(2)}',
                                        'GH¢ ${double.parse('1500.00').toStringAsFixed(2)}',
                                        'GH¢ ${double.parse('2000.00').toStringAsFixed(2)}',
                                      ],
                                      // items: [
                                      //   'GH¢ ${offers[index]['discount']}',
                                      // ],
                                      onChanged: print,
                                      selectedItem: 'Offer Price'),
                                ),
                              ],
                            ),
                            addVertical(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'Current Price',
                                  labelStyle: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            addVertical(size.height * 0.015),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR.withOpacity(0.15),
                                ),
                                child: Image.asset(
                                  // offers[index]['image'],
                                  'assets/images/cake.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVertical(15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            subText('Add Product as Offer', fontSize: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: true,
                                      disabledItemFn: (String s) {
                                        return s.startsWith('Co') ||
                                            s.startsWith('D');
                                      },
                                    ),
                                    items: const [
                                      'Anniversary',
                                      'Cookies (Coming Soon...)',
                                      'Birthday Cakes',
                                      'Desserts (Coming Soon...)',
                                      'Family',
                                      'Picnics (New)',
                                    ],
                                    onChanged: print,
                                    selectedItem: 'Add Product',
                                  ),
                                ),
                                addHorizontal(10),
                                Expanded(
                                  child: DropdownSearch<String>(
                                    popupProps: const PopupProps.menu(
                                      showSelectedItems: false,
                                    ),
                                    items: [
                                      'GH¢ ${double.parse('350.00').toStringAsFixed(2)}',
                                      'GH¢ ${double.parse('400.00').toStringAsFixed(2)}',
                                      'GH¢ ${double.parse('450.00').toStringAsFixed(2)}',
                                      'GH¢ ${double.parse('500.00').toStringAsFixed(2)}',
                                      'GH¢ ${double.parse('550.00').toStringAsFixed(2)}',
                                    ],
                                    onChanged: print,
                                    selectedItem: 'Offer Price',
                                  ),
                                ),
                              ],
                            ),
                            addVertical(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'Current Price',
                                  labelStyle: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            addVertical(size.height * 0.015),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR.withOpacity(0.15),
                                ),
                                child: Image.asset(
                                  // offers[index]['image'],
                                  'assets/images/cake.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVertical(size.height * 0.035),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
