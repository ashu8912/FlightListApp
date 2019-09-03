import 'package:flights_list/widgets/CustomShapeClipper.dart';
import "package:flutter/material.dart";

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);
final Color firstColor = Color(0xFFF47D15);
final Color secondColor = Color(0xFFEF772C);

class FlightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Result"),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[FlightListTopPart(),SizedBox(height:20),FlightListBottomPart()],
        ),
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                margin: EdgeInsets.all(20.0),
                elevation: 10.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Boston (Bos)",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 20.0,
                            ),
                            Text(
                              "New York City (JFK)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:1,
                        child: Icon(Icons.import_export,size: 32.0,))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      
    );
  }
}

class FlightListBottomPart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      double height=MediaQuery.of(context).size.height;
 
    return Padding(
      padding: EdgeInsets.only(left:16.0,),
    
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Best Deals For 6 Months",style: TextStyle(color:Colors.black,fontSize: 16.0),),
        ),
        SizedBox(height:20.0),
        Container(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
            FlightCard(),
            FlightCard(),
            FlightCard(),
            FlightCard(),
            FlightCard(),
          ],),
        )
      ],),
    
    );
  }
}

class FlightCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Stack(children:<Widget>[Container(
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(10.0)),
         border: Border.all(color: Colors.black12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Row(children: <Widget>[
              Text("\$4159",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              SizedBox(width:5.0),
              Text('(\$9999)',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,decoration: TextDecoration.lineThrough,color:Colors.grey))
            ],),

            Wrap(
              spacing: 4.0,
              children: <Widget>[
              FlightDetailChip(Icons.calendar_today, "June 2019"),
              FlightDetailChip(Icons.flight_takeoff, "Jet Airways"),
              FlightDetailChip(Icons.star, "4.4"),
              
            ],)
          ],),
        ),
        ),
        Positioned(
          top:10.0,
          right:0.0,
                child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),      
            decoration: BoxDecoration(color:Colors.orange.withOpacity(0.2),borderRadius: BorderRadius.all(Radius.circular(10.0))),      
            child:Text("55%",style:TextStyle(color:Theme.of(context).primaryColor,fontSize: 14.0,fontWeight: FontWeight.bold))
          ),
        )
      ]),
    );
  
  }
}

class FlightDetailChip extends StatelessWidget{
  final IconData iconData;
  final String label;
  FlightDetailChip(this.iconData,this.label);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
      child: RawChip(
      backgroundColor: Colors.black12,  
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black,fontSize: 14.0),
       avatar: Icon(iconData,size: 16.0,),
    ),);
  }
  
}