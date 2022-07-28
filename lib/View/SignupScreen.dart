// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/Controller/Authentication.dart';
import 'package:home_food_inventory_app/Controller/TextFieldInput.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_food_inventory_app/Controller/utils.dart';
import 'package:home_food_inventory_app/View/LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authentication().signupUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'Success') {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
  }

    void goToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              // svg image
              SvgPicture.asset(
                'assets/logo.svg',
                height: 90,
              ),
              const SizedBox(
                height: 40,
              ),
              // text field input for name
              TextFieldInput(
                hintText: 'Enter your Name',
                textInputType: TextInputType.text,
                textEditingController: _nameController,
              ),
              const SizedBox(
                height: 22,
              ),
              // text field input for email
              TextFieldInput(
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 22,
              ),
              // text field input for password
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 22,
              ),
              // button login
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.purple,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(flex: 2, child: Container()),
              // Transitioning to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text("Already have an account? "),
                  ),
                  GestureDetector(
                    onTap: goToLogin,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text(
                          "Login.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
