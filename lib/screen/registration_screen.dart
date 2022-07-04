import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_registartion/screen/home_screen.dart';
import 'package:login_registartion/services/auth_service.dart';
import 'package:login_registartion/widgets/custom_button.dart';
import 'package:login_registartion/widgets/custom_text_field.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registration Screen'),
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
                  labelName: 'First Name',
                  textInputType: TextInputType.name,
                  readOnly: false,
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Mobile Number',
                  textInputType: TextInputType.number,
                  readOnly: false,
                  controller: mobileNumberController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Password',
                  textInputType: TextInputType.name,
                  readOnly: false,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          await AuthServices()
                              .getRegistration(
                            name: firstNameController.text,
                            mobileNumber: mobileNumberController.text,
                            pin: passwordController.text,
                          )
                              .then(
                            (value) {
                              setState(() {
                                isLoading = false;
                              });
                              if (value.contains("Could Not Registration") ==
                                  false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                      mobileNumber: mobileNumberController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.green,
                                    elevation: 0,
                                    content:
                                        Text("Registration Successfully Save"),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    elevation: 0,
                                    content: Text(
                                        "Registration Failed Please Try Again !"),
                                  ),
                                );
                              }
                            },
                            onError: (error) {},
                          );
                        },
                        buttonName: 'Registration',
                      ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Are you registered? '),
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
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
