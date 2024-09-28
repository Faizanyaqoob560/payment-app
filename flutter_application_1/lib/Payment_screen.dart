import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final recipientController = TextEditingController();
  final amountController = TextEditingController();
  bool isprocessing = false;
  String transactionMessage = '';

  //implementiong funtion to process method

  void processpayments() async {
    setState(() {
      isprocessing = true;
      transactionMessage = '';
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isprocessing = false;
      double? amount = double.tryParse(amountController.text);
      transactionMessage = (amount != null && amount > 0)
          ? "payment sucesfull!"
          : 'Payment Failed!enter correct amount';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Recipient Field
            TextField(
              controller: recipientController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Amount Field
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "enter Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //payment done and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Pay button
                ElevatedButton(
                  onPressed: isprocessing
                      ? null
                      : processpayments, // Disable button during processing
                  child: isprocessing
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Pay'),
                ),

                // Cancel button
                ElevatedButton(
                  onPressed: isprocessing
                      ? null
                      : () {
                          Navigator.pop(
                              context); // Go back when Cancel is clicked
                        },
                  child: const Text('Cancel'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Display payment result message (success or failure)
            Text(
              transactionMessage,
              style: TextStyle(
                fontSize: 18,
                color: transactionMessage.contains('successful')
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
