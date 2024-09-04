import 'package:flutter/material.dart';
import 'package:flutter_application_1/Textfield.dart';
import 'package:flutter_application_1/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Icon
                  const Icon(
                    Icons.person_add,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 50),

                  // Welcome Text
                  const Text(
                    "Create a new account",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),

                  // Email TextField
                  MyTextfield(
                    controller: emailController,
                    HintText: "Enter email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Password TextField
                  MyTextfield(
                    controller: passwordController,
                    HintText: "Enter password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  // Confirm Password
                  MyTextfield(
                    controller: confirmPasswordController,
                    HintText: "Confirm password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // SignUp Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Link to Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
