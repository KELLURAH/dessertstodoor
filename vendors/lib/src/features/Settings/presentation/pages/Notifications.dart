import 'package:flutter/material.dart';

class NoticiationsPage extends StatefulWidget {
  const NoticiationsPage({Key? key}) : super(key: key);

  @override
  State<NoticiationsPage> createState() => _NoticiationsPageState();
}

class _NoticiationsPageState extends State<NoticiationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications'),
      ),
    );
  }
}
