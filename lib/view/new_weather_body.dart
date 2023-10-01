
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( 'there is no weather 😔 start',
              style: TextStyle(fontSize: 24),),


            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Searching now 🔍",style: TextStyle(fontSize: 24),),
             // Icon(Icons.search,size: 28),
            ],
          )
        ]);
  }
}
