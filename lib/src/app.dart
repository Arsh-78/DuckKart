import 'package:flutter/material.dart';
import 'package:untitled/src/ui/all_creators.dart';
import 'package:untitled/src/ui/creator_Donation.dart';
import 'package:untitled/src/ui/donationsList.dart';

class App extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: AllCreators.id,
      routes:{
        AllCreators.id : (context) => AllCreators(),
        DonationList.id : (context) => DonationList(),
      },

    );
  }

}

