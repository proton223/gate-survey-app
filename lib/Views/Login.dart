import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool agreement = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Survey-Gate Login'),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/illustration.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                ),
                //Login Form
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      usernameController.text = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      passwordController.text = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: agreement,
                      onChanged: (bool? value) {
                        setState(() {
                          agreement = value!;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text(
                          'By checking this box, you agree to our terms and conditions.',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    usernameController.text != '' &&
                            passwordController.text != '' &&
                            agreement
                        ? Get.to(() => const HomePage())
                        : Get.snackbar(
                            'Error',
                            'Please fill in the fields',
                            backgroundColor: Colors.red.shade400,
                            isDismissible: true,
                            dismissDirection: DismissDirection.horizontal,
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade600,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE0E0E0),
                      // color: Color(0xFF42a5f5)
                    ),
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
