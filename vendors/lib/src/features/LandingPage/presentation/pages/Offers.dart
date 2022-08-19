import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../widgets/offersCard.dart';

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
      'name': 'Birthday Promo',
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

  _callModal({size}) {
    showDialog(
      context: context,
      // barrierDismissible: true,
      builder: (context) => SizedBox(
        height: size.height * 0.85,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.29),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Dialog(
            backgroundColor: Colors.grey[400],
            elevation: 1.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Card(
                    elevation: .75,
                    child: SizedBox(
                      height: size.height * 0.065,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/offer.png',
                          height: 40,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // TODO include add personnel logic
                        },
                        title: Text(
                          'Add Package as an Offer',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            letterSpacing: .25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVertical(size.height * 0.0075),
                  Card(
                    elevation: .75,
                    child: ListTile(
                      leading: const Icon(Icons.person, color: OFFERS_COLOR),
                      onTap: () {
                        Navigator.pop(context);
                        // TODO include add personnel logic
                      },
                      title: Text(
                        'Add Product as an Offer',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          letterSpacing: .25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  addVertical(size.height * 0.0075),
                  Card(
                    elevation: .75,
                    child: ListTile(
                      leading: const Icon(Icons.person, color: OFFERS_COLOR),
                      onTap: () {
                        Navigator.pop(context);
                        // TODO include add personnel logic
                      },
                      title: Text(
                        'Add Vibes as an Offer',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          letterSpacing: .25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: OFFERS_COLOR,
        onPressed: () => _callModal(size: size),
        child: const Icon(Icons.add, size: 40),
      ),
      body: screenBody(
        size: size,
        children: [
          Container(
            decoration: const BoxDecoration(color: BACKGROUND_COLOR),
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
                      Expanded(
                        child: subText(
                          'Only two offers can be created per vendor...',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: .35, color: Colors.black54),
                addVertical(10),
                // Builder(builder: (context) {
                //   return Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //         decoration: const BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black12,
                //               blurRadius: 5,
                //               spreadRadius: 1,
                //             ),
                //           ],
                //         ),
                //         child: Card(
                //           child: Container(
                //             padding: const EdgeInsets.all(5),
                //             height: MediaQuery.of(context).size.height * 0.4,
                //             child: Builder(builder: (context) {
                //               return Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   subText('Add Package as Offer', fontSize: 15),
                //                   Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       Expanded(
                //                         child: DropdownSearch<String>(
                //                           popupProps: PopupProps.menu(
                //                             showSelectedItems: true,
                //                             disabledItemFn: (String s) {
                //                               return s.startsWith('Co') ||
                //                                   s.startsWith('D') ||
                //                                   s.startsWith('P');
                //                             },
                //                           ),
                //                           items: const [
                //                             'Anniversary',
                //                             'Cookies (Coming Soon...)',
                //                             'Birthday',
                //                             'Desserts (Coming Soon...)',
                //                             'Family',
                //                             'Picnics (Coming Soon...)',
                //                           ],
                //                           // items: offers[index]['name'],

                //
                //             onChanged: print,
                //                           selectedItem: 'Add Package',
                //                         ),
                //                       ),
                //                       addHorizontal(10),
                //                       Expanded(
                //                         child: DropdownSearch<String>(
                //                           popupProps: const PopupProps.menu(
                //                             showSelectedItems: false,
                //                           ),
                //                           items: [
                //                             'GH¢ ${double.parse('1000.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('1200.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('1250.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('1500.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('2000.00').toStringAsFixed(2)}',
                //                           ],
                //                           // items: [
                //                           //   'GH¢ ${offers[index]['discount']}',
                //                           // ],
                //                           onChanged: print,
                //                           selectedItem: 'Offer Price',
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   addVertical(10),
                //                   Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 70),
                //                     child: TextFormField(
                //                       readOnly: true,
                //                       decoration: InputDecoration(
                //                         labelText: 'Current Price',
                //                         labelStyle: GoogleFonts.poppins(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.w500,
                //                           fontSize: 15,
                //                         ),
                //                         border: OutlineInputBorder(
                //                           borderRadius: BorderRadius.circular(5),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   addVertical(size.height * 0.015),
                //                   Center(
                //                     child: Container(
                //                       decoration: BoxDecoration(
                //                         color: PRIMARY_COLOR.withOpacity(0.05),
                //                       ),
                //                       child: Image.asset(
                //                         // offers[index]['image'],
                //                         'assets/images/cake.png',
                //                         fit: BoxFit.cover,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               );
                //             }),
                //           ),
                //         ),
                //       ),
                //       addVertical(15),
                //       Container(
                //         decoration: const BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black12,
                //               blurRadius: 5,
                //               spreadRadius: 1,
                //             ),
                //           ],
                //         ),
                //         child: Card(
                //           child: Container(
                //             padding: const EdgeInsets.all(5),
                //             height: MediaQuery.of(context).size.height * 0.4,
                //             child: Expanded(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   subText('Add Product as Offer', fontSize: 15),
                //                   Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       Expanded(
                //                         child: DropdownSearch<String>(
                //                           popupProps: PopupProps.menu(
                //                             showSelectedItems: true,
                //                             disabledItemFn: (String s) {
                //                               return s.startsWith('Co') ||
                //                                   s.startsWith('D');
                //                             },
                //                           ),
                //                           items: const [
                //                             'Anniversary',
                //                             'Cookies (Coming Soon...)',
                //                             'Birthday Cakes',
                //                             'Desserts (Coming Soon...)',
                //                             'Family',
                //                             'Picnics (New)',
                //                           ],
                //                           onChanged: print,
                //                           selectedItem: 'Add Product',
                //                         ),
                //                       ),
                //                       addHorizontal(10),
                //                       Expanded(
                //                         child: DropdownSearch<String>(
                //                           popupProps: const PopupProps.menu(
                //                             showSelectedItems: false,
                //                           ),
                //                           items: [
                //                             'GH¢ ${double.parse('350.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('400.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('450.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('500.00').toStringAsFixed(2)}',
                //                             'GH¢ ${double.parse('550.00').toStringAsFixed(2)}',
                //                           ],
                //                           onChanged: print,
                //                           selectedItem: 'Offer Price',
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   addVertical(10),
                //                   Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 70),
                //                     child: TextFormField(
                //                       readOnly: true,
                //                       decoration: InputDecoration(
                //                         labelText: 'Current Price',
                //                         labelStyle: GoogleFonts.poppins(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.w500,
                //                           fontSize: 15,
                //                         ),
                //                         border: OutlineInputBorder(
                //                           borderRadius: BorderRadius.circular(5),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   addVertical(size.height * 0.015),
                //                   Center(
                //                     child: Container(
                //                       decoration: BoxDecoration(
                //                         color: PRIMARY_COLOR.withOpacity(0.15),
                //                       ),
                //                       child: Image.asset(
                //                         // offers[index]['image'],
                //                         'assets/images/cake.png',
                //                         fit: BoxFit.cover,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       addVertical(size.height * 0.035),
                //       // PaymentInfoSettings(size, '0201154679')
                //     ],
                //   );
                // }),
                // * New Looks
                Builder(
                  builder: (context) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 40),
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.125,
                          child: OffersCards(
                            backgroundColor: OFFERS_COLOR.withOpacity(.725),
                            subtitle: offers[index]['discount'],
                            image: offers[index]['image'],
                            title: offers[index]['name'],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.025,
                        crossAxisSpacing: 2.5,
                        mainAxisSpacing: 10,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
