import 'package:flutter/material.dart';

import '../services/customer_services.dart';
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
        body: StreamBuilder(
          stream: CustomerServices.getAllCustomer(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('Name:  ${snapshot.data[i]['cname']}'),
                      subtitle: Text('Mobile:  ${snapshot.data[i]['cmobile']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await CustomerServices.deleteCustomer(
                            id: snapshot.data[i]['cid'].toString(),
                          ).then((value) {
                            if (value == "customer Deleted Successfully") {
                              setState(() {});
                            }
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
