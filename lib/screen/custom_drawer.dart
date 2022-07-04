import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.mobileNumber,
    required this.password,
  }) : super(key: key);
  final String mobileNumber, password;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    check();
  }

  String? name, mobile;

  check() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
      await AuthServices()
          .getProfile(
        mobileNumber: widget.mobileNumber,
        pin: widget.password,
      )
          .then(
        (value) {
          setState(() {
            name = jsonDecode(value)['result'][0]['si_first_name'];
            mobile = jsonDecode(value)['result'][0]['si_mobile'];
            isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name ?? ''),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(mobile ?? ''),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
