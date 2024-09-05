import 'package:flutter/material.dart';

class OrderViewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> liveTables;

  OrderViewScreen({required this.liveTables});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor:  Colors.transparent,

          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "Ordered table",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff00008B)),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        itemCount: liveTables.length,
        itemBuilder: (context, index) {
          var table = liveTables[index];
          return ListTile(
            title: Text(table['name']),
            subtitle: Text('Ordered Food: ${table['food'].join(', ')}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.pop(context); // Go back to HomeScreen
        },
        child: Icon(Icons.home),
        tooltip: 'Move to Home Screen',
      ),
    );
  }
}
