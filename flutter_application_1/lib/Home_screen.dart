import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final double accountBalance = 22.053;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paymwnt app",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Header"),
            ),
            ListTile(
              title: Text("one"),
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text("two"),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              const Text(
                'Welcome, Faizan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Manage your money with ease',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Account Balance Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Balance',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$$accountBalance',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Payment Button
                  GestureDetector(
                    onTap: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.send,
                          size: 40,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Payments',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  // History Button
                  GestureDetector(
                    onTap: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.history,
                          size: 40,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'History',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  // more button

                  GestureDetector(
                    onTap: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          size: 40,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'More',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
