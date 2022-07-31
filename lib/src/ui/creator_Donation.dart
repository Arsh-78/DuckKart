import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/src/models/creator_model.dart';


class CreatorDonation extends StatefulWidget {
  static const String id = 'creator_donationScreen';
  CreatorModel currentCreator;

  CreatorDonation({required this.currentCreator});

  @override
  State<CreatorDonation> createState() => _CreatorDonationState();
}

class _CreatorDonationState extends State<CreatorDonation> {
  String donation = '';
  String currencyValue = '\$';
  var items = ['\$','₹'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        titleSpacing: 0.0,

        title: Row(
          children: [
            Text(widget.currentCreator.username,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             SizedBox(width: 5.0,),
             Icon(Icons.verified_sharp,color: Colors.blue,),
          ],
        ),
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,))),

            Expanded(child:CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(widget.currentCreator.profileUrl),
              ),),
            SizedBox(width: 5.0,)
          ],
        ),


      ),
      body:SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(30.0),
                child :Text('Send your Love to ${widget.currentCreator.username} to Become a real fan',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17.0),textAlign: TextAlign.center,),
        ), Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,
                            child: DropdownButton(

                              // Initial Value
                              value: currencyValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  currencyValue = newValue!;
                                });
                              },
                            ), ),

                        Expanded(
                          flex: 9,
                          child: TextField(
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            style: TextStyle(color: Colors.black),
          onChanged:(String text){
                              setState((){
                                donation =text;
                              });
          },
                            keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '200'
                          ),),
                        ),
                      ],
                    )//,
                  ),
              SizedBox(height: 30.0,),

              TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Your Name (Optional)' ),),

              SizedBox(height: 30.0,),
              const SizedBox(
                height: 200.0,
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: 'Say Something (optional'),
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),

              SizedBox(
                height: 50.0,
              ),

              ElevatedButton(onPressed: (){}, child: Text('Support ${currencyValue}${donation}'))
            ],
          ),
        ),
      ),
    );
  }
}
