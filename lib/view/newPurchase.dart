import 'package:flutter/material.dart';

class Purchase extends StatelessWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Net Total
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Net Total:',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              initialValue: '0',
              enabled: false,
            ),
            SizedBox(height: 16.0),

            // Payment Method
            Text(
              'Payment Method:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: 'Cash',
              items: <String>['Cash', 'Card', 'Online Payment']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle the selection change if needed
              },
            ),
            SizedBox(height: 16.0),

            // Advance Balance
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Advance Balance:',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
              initialValue: '0',
            ),
            SizedBox(height: 16.0),

            // Payment Due
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Payment Due:',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              initialValue: '0',
              enabled: false,
            ),
            SizedBox(height: 16.0),

            // Payment Note
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Payment Note:',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Additional Notes
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Additional Notes:',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
