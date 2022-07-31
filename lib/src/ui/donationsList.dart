import 'package:flutter/material.dart';
import 'package:untitled/src/blocs/donation_Bloc.dart';


class DonationList extends StatelessWidget {
  static const String id = 'DonationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Donations'),),
      body: MyDonationsTable(),
    );
  }
}
 class MyDonationsTable extends StatelessWidget
 {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Table(
        border: TableBorder.all(width: 1.0,color:Colors.black),
        children: userDonationBloc.userDonationProvider.donations.map((donation){
          return TableRow(children: [
            TableCell(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(donation.creatorId),
                Text(donation.name),
                Text(donation.currrencyValue),
                Text(donation.amount),
                Text(donation.message)
              ],
            ),
            )
          ]);
        }).toList(),
      ),
    );
  }
   
 }