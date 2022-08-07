import 'package:flutter/material.dart';

import '../../../../../core/components/widgetFunctions.dart';

class NoticiationsPage extends StatefulWidget {
  const NoticiationsPage({Key? key}) : super(key: key);

  @override
  State<NoticiationsPage> createState() => _NoticiationsPageState();
}

class _NoticiationsPageState extends State<NoticiationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Notifications',
        context: context,
      ),
      body: const Center(
        child: Text('Notifications'),
      ),
    );
  }
}
