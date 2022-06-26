import 'package:flutter/material.dart';
import 'package:login_registartion/widgets/custom_button.dart';
import 'package:login_registartion/widgets/custom_text_field.dart';

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

                const  SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Mobile Number',
                  textInputType: TextInputType.number,
                  readOnly: false,
                  controller: mobileNumberController,
                  textInputAction: TextInputAction.next,

                ),
                const   SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'Password',
                  textInputType: TextInputType.name,
                  readOnly: false,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,

                ),
                const   SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    AuthServices().login();


                  },
                  buttonName: 'Login',
                ),


                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context
                    );
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
