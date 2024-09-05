import 'package:flutter/material.dart';
import 'orderScreen.dart';
import 'orderView.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> liveTables = [];
  List<String> emptyTables = List.generate(10, (index) => "Table ${index + 1}");

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
            "Order details",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff00008B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            // Live Tables Section
            Text("Live tables (${liveTables.length})"),
            SizedBox(height: 10,),
            GridView.builder(
              itemCount: liveTables.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                var table = liveTables[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: height / 5,
                    width: width / 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset("asset/images/table.jpg"),
                        Text(table['name']),
                        // Text('Ordered Food: ${table['food'].join(', ')}'),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Empty Tables Section
            Text("Empty tables (${emptyTables.length})"),
            GridView.builder(
              itemCount: emptyTables.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(
                          table: emptyTables[index],
                          onOrderSubmitted: (table, orderedFood) {
                            setState(() {
                              liveTables.add({'name': table, 'food': orderedFood});
                              emptyTables.remove(table);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: height / 5,
                      width: width / 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset("asset/images/table.jpg"),
                          Text(emptyTables[index]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20), // Add space before the button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderViewScreen(liveTables: liveTables)),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.amber, // Set the text color to black (optional)
              ),
              child: Text("Order View"),
            )

          ],
        ),
      ),
    );
  }
}
