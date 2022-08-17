import 'package:flutter/material.dart';
import 'package:vendors/core/utils/Colors.dart';

import '../../../../../core/components/widgetFunctions.dart';

class NoticiationsPage extends StatefulWidget {
  const NoticiationsPage({Key? key}) : super(key: key);

  @override
  State<NoticiationsPage> createState() => _NoticiationsPageState();
}

class _NoticiationsPageState extends State<NoticiationsPage> {
  List<Map> notifications = [
    {
      'title': 'New Offer',
      'description': 'You have a new offer',
      'details': 'gibberish',
      'date': '10/10/2020',
      'time': '10:20 AM',
    },
    {
      'title': 'New Order',
      'description': 'You have a new order from George',
      'details': 'gibberish',
      'date': '10/10/2020',
      'time': '10:12 AM',
    },
    {
      'title': 'New Offer',
      'description': 'You have a new offer',
      'details': 'gibberish',
      'date': '10/10/2020',
      'time': '10:05 AM',
    },
    {
      'title': 'New Offer',
      'description': 'You have a new offer',
      'details': 'gibberish',
      'date': '10/10/2020',
      'time': '09:47 AM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'Notifications',
        context: context,
      ),
      body: screenBody(
        size: size,
        children: [
          Container(
            // height: size.height * 0.35,
            decoration: const BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.white12,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Card(
                    // color: OFFERS_COLOR.withOpacity(.075),
                    elevation: 1.275,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: OFFERS_COLOR.withOpacity(.65),
                        child: subTextRaleway(
                          '${index + 1}',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      title: subText(
                        notifications[index]['title'],
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: subText(
                        notifications[index]['details'],
                        fontWeight: FontWeight.w500,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Column(
                children: [
                  addVertical(5),
                  const Divider(color: Colors.black54, thickness: .35),
                  addVertical(5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
