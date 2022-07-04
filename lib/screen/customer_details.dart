import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_registartion/widgets/custom_button.dart';
import 'package:login_registartion/widgets/custom_text_field.dart';

import '../services/auth_service.dart';
import '../services/customer_services.dart';
import 'home_screen.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  bool isLoading = false;

  @override
  initState() {
    super.initState();

    setState(() {
      firstNameController.text = widget.data['cname'];
      mobileNumberController.text = widget.data['cmobile'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Customer Update Screen'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Full Name',
                  textInputType: TextInputType.number,
                  readOnly: false,
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Mobile',
                  textInputType: TextInputType.name,
                  readOnly: false,
                  controller: mobileNumberController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onPressed: () async {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          await CustomerServices.updateCustomer(
                            mobile: mobileNumberController.text,
                            name: firstNameController.text,
                            id: widget.data['cid'],
                          ).then(
                            (value) {
                              print(value);

                              if (value == "Customer Updated Successfully") {
                                Navigator.pop(context, true);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.green,
                                    elevation: 0,
                                    content: Text("Login Successfully"),
                                  ),
                                );

                                // Navigator.pushNamed(context, '/home');
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  elevation: 0,
                                  content: Text(
                                      "Mobile Number or Password not matched !"),
                                ));
                              }
                            },
                            onError: (error) {
                              print(error);
                            },
                          );
                        },
                        buttonName: 'Update',
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
