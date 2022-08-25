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
      'image': 'assets/images/logo.png',
      'discount': '1700',
    },
    {
      'name': 'Romantic',
      'image': 'assets/images/dessert.png',
      'discount': '2500',
    },
  ];

  List<Map> recentOrders = [
    {
      'cus_name': 'John Doe',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Cake',
      'image': 'assets/images/cake.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'Flutter Ghana',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Anniversary',
      'image': 'assets/images/cupcake.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'John',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Cake',
      'image': 'assets/images/cookie.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'Joseph',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Anniversary',
      'image': 'assets/images/cake.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Mobile Money',
    },
    {
      'cus_name': 'John Doe',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Cake',
      'image': 'assets/images/logo.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'John Doe',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Anniversary',
      'image': 'assets/images/logo.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'John Doe',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Cake',
      'image': 'assets/images/cake.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
    {
      'cus_name': 'John Doe',
      'order_no': '12345',
      'order_date': '12/12/2020',
      'order_item': 'Cake',
      'image': 'assets/images/cake.png',
      'due_date': '12/12/2020',
      'payment_status': 'Paid',
      'payment_mode': 'Cash on Delivery',
    },
  ];

  callModal({size}) {
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
        // backgroundColor: Colors.white,
        elevation: 0.25,
        title: Text(
          'Orders',
          style: GoogleFonts.poppins(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: screenBody(
        size: size,
        children: [
          subTextRaleway('Sort out your orders with these filters:'),
          const Divider(thickness: .5),
          addVertical(10),
          // ? Filter

          SizedBox(
            height: size.height * 0.2,
            child: Builder(
              builder: (context) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 40),
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: size.height * 0.12,
                      child: Builder(
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white54,
                            ),
                            child: OffersCards(
                              backgroundColor: OFFERS_COLOR.withOpacity(.725),
                              subtitle: offers[index]['discount'],
                              image: offers[index]['image'],
                              title: offers[index]['name'],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => addHorizontal(10),
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: offers.length,
                  //   childAspectRatio: 1.025,
                  //   crossAxisSpacing: 2.5,
                  //   mainAxisSpacing: 10,
                  // ),
                );
              },
            ),
          ),
          addVertical(size.height * 0.0035),

          subTextRaleway('Your Due Orders', letterSpacing: .35),
          const Divider(thickness: .5),
          addVertical(10),
          SizedBox(
            height: size.height * 0.75,
            child: ListView.separated(
              itemCount: recentOrders.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    orderDetailsDialog(context, size, index);
                  },
                  child: SizedBox(
                    height: size.height * 0.1,
                    child: Card(
                      elevation: 1.25,
                      // color: SECOND_COLOR,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // color: Colors.white70,
                        ),
                        child: OrdersCard(
                          image: recentOrders[index]['image'],
                          title: recentOrders[index]['order_item'],
                          subtitle: recentOrders[index]['cus_name'],
                          header: 'Order No:',
                          value: recentOrders[index]['order_no'],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => addVertical(10),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> orderDetailsDialog(
      BuildContext context, Size size, int index) {
    return showDialog(
      context: context,
      builder: (context) => Container(
        width: size.width * 0.3,
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.3,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVertical(10),
                subText('Order Details'),
                const Divider(color: Colors.black54, thickness: .5),
                addVertical(10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subText('Order No:', fontWeight: FontWeight.w500),
                          subText(
                            recentOrders[index]['order_no'],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          subText(
                            'Due Date:',
                            fontWeight: FontWeight.w500,
                          ),
                          subText(
                            recentOrders[index]['due_date'],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                addVertical(5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subText('Order No:', fontWeight: FontWeight.w500),
                          subText(
                            recentOrders[index]['order_no'],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          subText(
                            'Due Date:',
                            fontWeight: FontWeight.w500,
                          ),
                          subText(
                            recentOrders[index]['due_date'],
                          ),
                        ],
                      ),
                    ],
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
