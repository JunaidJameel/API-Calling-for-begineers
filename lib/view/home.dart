import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import 'widget/content_widget.dart'; // Import your Data model

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API Calling',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.data.isEmpty) {
            // Show loading indicator while fetching data
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Show the fetched data
            return const ContentWidget();
          }
        },
      ),
    );
  }
}
