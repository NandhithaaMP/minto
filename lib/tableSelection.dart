import 'package:flutter/material.dart';

class TableSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Table')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: 12, // Number of tables
        itemBuilder: (context, index) {
          bool isOccupied = index % 2 == 0; // Example condition for table status
          return GestureDetector(
            onTap: () {
              if (!isOccupied) {
                Navigator.pushNamed(context, '/orders');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isOccupied ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Table ${index + 1}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
