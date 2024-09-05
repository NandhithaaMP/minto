import 'package:flutter/material.dart';

import 'loginScreen.dart';
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SizedBox.expand(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("asset/images/food22.jpg",),fit: BoxFit.fitHeight),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height/1.5,),
                 Text(" MINTO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 50),),
                 Text("   Where every flavour tells a story.....!!",style: TextStyle(color: Colors.white,fontSize: 15),),
                SizedBox(height: height/9),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Center(
                    child: Container(child: Center(child: Text("Get Started",style: TextStyle(fontSize: 15),)),
                      decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 250,
                    ),
                  ),
                )
              ],
            ),
          ),
          
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text("  MINTO",textAlign: TextAlign.end,
        //     style:TextStyle(fontWeight:FontWeight.bold,fontSize: 40),),
        //   ],
        // ),
      ),
    );
  }
}
