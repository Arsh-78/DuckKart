import 'package:flutter/material.dart';
import 'package:untitled/src/blocs/creators_bloc.dart';
import 'package:untitled/src/ui/creator_Donation.dart';

import '../models/creator_model.dart';
import '../resources/navDrawer.dart';


class AllCreators extends StatelessWidget {
  static const String id ='all_creators';
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllCreators();
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('All Creators'),
        backgroundColor: Color(0XFF5D3FD3),
      ),
      body: StreamBuilder(
        stream: bloc.allCreators,
        builder: (context,AsyncSnapshot<List<CreatorModel>> snapshot){
          if(snapshot.hasData)
            {
              return buildList(snapshot);
            }
          else if(snapshot.hasError)
            {
              return Text(snapshot.error.toString());
            }
          return Center(child: CircularProgressIndicator());
      },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<CreatorModel>> snapshot) {
    return GridView.builder(itemCount: snapshot.data!.length,gridDelegate:  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context,int index){
      return InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context){
          return CreatorDonation(currentCreator: snapshot.data![index]);
        }));
      },
        child: Container(
          width: 90,
          height: 90,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          child: Column(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
               child : Image.network(snapshot.data![index].profileUrl,fit: BoxFit.cover,height: 120,width: 150,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,top: 5.0),
                        child: Text(snapshot.data![index].username,style: TextStyle(fontSize: 14.5,fontWeight: FontWeight.w700),),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(left: 25.0),
                         child: Text(snapshot.data![index].profession,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                       ),

                    ],
                  ),
                  Padding(
                    padding:EdgeInsets.only(right: 25.0),
                   child: Icon(Icons.favorite_border_rounded,size: 20.0,),
                  )
                ],
              )
            ],

          ),
        ),
      );
       },
    );
  }

}

/*
Image.network(snapshot.data![index].profileUrl,fit: BoxFit.cover,)*/
