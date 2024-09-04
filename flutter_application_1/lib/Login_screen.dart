import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'textfield.dart';

class LoginScreen extends StatelessWidget {
  final Usernamecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();

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
                  // logo icon
                  const Icon(
                    Icons.lock,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 50),

                  // greetings msg
                  const Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),

                  // Username TextField
                  MyTextfield(
                    controller: Usernamecontroller,
                    HintText: "Enter username",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Password TextField
                  MyTextfield(
                    controller: Passwordcontroller,
                    HintText: "Enter password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to HomeScreen after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Forgot Password & Sign Up Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
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
