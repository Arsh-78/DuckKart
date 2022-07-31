import 'package:flutter/material.dart';
import 'package:untitled/src/ui/donationsList.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Text('Side Menu',style: TextStyle(color: Colors.black,fontSize: 25),

          ),
          decoration: BoxDecoration(color: Colors.blue),),
          ListTile(leading: Icon(Icons.monetization_on_rounded),
          title: Text('My Donations'),
          onTap: ()=> Navigator.pushNamed(context, DonationList.id),)
        ],
      ),
    );
  }

}