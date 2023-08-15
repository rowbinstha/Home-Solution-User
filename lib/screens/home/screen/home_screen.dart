import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/home/homeScreen/home_screen_fragments/explore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // clearCartNow(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Explore(),
    );
  }
}
