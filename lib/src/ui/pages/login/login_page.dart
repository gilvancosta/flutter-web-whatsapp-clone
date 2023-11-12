import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_web_whatsapp/src/core/ui/default_colors/default_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //bool doesUserWantToSignIn = false;
  bool doesUserWantToSignUp = false;
  Uint8List? selectedImage;

  bool errorInPicture = false;
  bool errorInName = false;
  bool errorInEmail = false;
  bool errorInPassword = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loadingOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: DefaultColors.backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                    color: DefaultColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Visibility(
                  visible:
                      MediaQuery.of(context).size.height > 700 ? true : false,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'WhatsApp',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Card(
                    elevation: 6,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      width: 500,
                      child: Column(
                        children: [
                          //Profile Image
                          Visibility(
                            visible: doesUserWantToSignUp,
                            child: ClipOval(
                              child: selectedImage != null
                                  ? Image.memory(
                                      selectedImage!,
                                      width: 124,
                                      height: 124,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('images/avatar.png',
                                      width: 124,
                                      height: 124,
                                      fit: BoxFit.cover),
                            ),
                          ),
                          //Outlined Choose picture Button
                          Visibility(
                            visible: doesUserWantToSignUp,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: errorInPicture
                                  ? OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.red, width: 3),
                                    )
                                  : null,
                              child: const Text('Select an image'),
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          //name textfield

                          TextField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              suffixIcon: const Icon(Icons.person_outline),
                              enabledBorder: errorInName
                                  ? const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3),
                                    )
                                  : null,
                            ),
                          ),
                          // email text field
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              suffixIcon: const Icon(Icons.email_outlined),
                              enabledBorder: errorInEmail
                                  ? const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3),
                                    )
                                  : null,
                            ),
                          ),
                          // password text field
                          Visibility(
                            visible: doesUserWantToSignUp,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: doesUserWantToSignUp
                                      ? 'Must have greater tan 7 characters'
                                      : 'Write your correct password',
                                  labelText: 'Password',
                                  suffixIcon:
                                      const Icon(Icons.lock_outline_rounded),
                                  enabledBorder: errorInPassword
                                      ? const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 3),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          //login signup button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DefaultColors.primaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: loadingOn
                                    ? const SizedBox(
                                        height: 19,
                                        width: 19,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        doesUserWantToSignUp
                                            ? "Sign Up"
                                            : "Login",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                            ),
                          ),

                          //toggle button
                          Row(
                            children: [
                              const Text("Login"),
                              Switch(
                                value: doesUserWantToSignUp,
                                onChanged: (bool value) {
                                  setState(() {
                                    doesUserWantToSignUp = value;
                                  });
                                },
                              ),
                              const Text("Sign Up"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
