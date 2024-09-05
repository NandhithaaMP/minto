import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final String table;
  final Function(String, List<String>) onOrderSubmitted;

  OrderScreen({required this.table, required this.onOrderSubmitted});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> menu = ["Pizza", "Burger", "Pasta", "Salad", "Steak"];
  List<String> selectedFood = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.transparent,

          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
              "Order for ${widget.table}",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff00008B)),
          ),
          centerTitle: true,
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Order for ${widget.table}"),
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: menu.map((foodItem) {
                return CheckboxListTile(
                  title: Text(foodItem),
                  value: selectedFood.contains(foodItem),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedFood.add(foodItem);
                      } else {
                        selectedFood.remove(foodItem);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedFood.isNotEmpty) {
                widget.onOrderSubmitted(widget.table, selectedFood);
                Navigator.pop(context); // Go back to HomeScreen
              }
            },
            child: Text("Submit Order"),
          ),
        ],
      ),
    );
  }
}
