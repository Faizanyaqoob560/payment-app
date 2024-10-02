import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  // Sample transaction data
  final List<Map<String, String>> transactions = [
    {
      'date': '2024-09-01',
      'amount': '100',
      'recipient': 'Alice',
      'status': 'Success'
    },
    {
      'date': '2024-09-02',
      'amount': '50',
      'recipient': 'Bob',
      'status': 'Failed'
    },
    {
      'date': '2024-09-03',
      'amount': '200',
      'recipient': 'Charlie',
      'status': 'Success'
    },
    {
      'date': '2024-09-04',
      'amount': '300',
      'recipient': 'Diana',
      'status': 'Success'
    },
    {
      'date': '2024-09-05',
      'amount': '150',
      'recipient': 'Eve',
      'status': 'Failed'
    },
  ];

  List<Map<String, String>> filteredTransactions = [];
  String filterStatus = "All"; // Default filter is 'All'

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions; // Initially show all transactions
  }

  // Function to filter transactions by status
  void filterTransactions(String status) {
    setState(() {
      if (status == "All") {
        filteredTransactions = transactions; // Show all transactions
      } else {
        filteredTransactions = transactions
            .where((transaction) => transaction['status'] == status)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Column(
        children: [
          // Filter Dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: filterStatus,
              onChanged: (String? newValue) {
                setState(() {
                  filterStatus = newValue!;
                  filterTransactions(filterStatus);
                });
              },
              items: <String>['All', 'Success', 'Failed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          // Transaction List
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      transaction['status'] == 'Success'
                          ? Icons.check_circle
                          : Icons.error,
                      color: transaction['status'] == 'Success'
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text('Recipient: ${transaction['recipient']}'),
                    subtitle: Text(
                        'Date: ${transaction['date']}\nAmount: \$${transaction['amount']}'),
                    trailing: Text(
                      transaction['status']!,
                      style: TextStyle(
                        color: transaction['status'] == 'Success'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
