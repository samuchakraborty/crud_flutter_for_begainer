import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_registartion/widgets/custom_button.dart';
import 'package:login_registartion/widgets/custom_text_field.dart';

import '../home_screen.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
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
                    :  CustomButton(
                  onPressed: () async {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    await AuthServices()
                        .getLogin(
                      mobileNumber: mobileNumberController.text,
                      pin: passwordController.text,
                    )
                        .then(
                      (value) {
                        print(value);

                        if (value ==
                            "Data Matched") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              elevation: 0,
                              content: Text(
                                  "Login Successfully"),
                            ),
                          );

                          // Navigator.pushNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            elevation: 0,
                            content:
                                Text("Mobile Number or Password not matched !"),
                          ));
                        }
                      },
                      onError: (error) {
                        print(error);
                      },
                    );
                  },
                  buttonName: 'Login',
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Are you not registered? '),
                      Text(
                        'Sign up',
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
