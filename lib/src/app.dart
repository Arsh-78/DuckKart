import 'package:flutter/material.dart';
import 'package:untitled/src/ui/all_creators.dart';
import 'package:untitled/src/ui/creator_Donation.dart';

class App extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: AllCreators.id,
      routes:{
        AllCreators.id : (context) => AllCreators(),
      },

    );
  }

}

