import 'package:flutter/material.dart';

import 'custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.mobileNumber,
    required this.password,
  }) : super(key: key);
  final String mobileNumber, password;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(
          mobileNumber: widget.mobileNumber,
          password: widget.password,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
        ),
      ),
    );
  }
}
