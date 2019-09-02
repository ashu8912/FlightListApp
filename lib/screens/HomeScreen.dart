import 'package:flights_list/widgets/CustomShapeClipper.dart';
import "package:flutter/material.dart";

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  int _selectedLocationIndex = 0;
  bool isFlightSelected=true;
  final List<String> locations = ["Boston (Bos)", "New York (NY)"];
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 400.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [firstColor, secondColor],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(Icons.location_on, color: Colors.white)),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          print(index);
                          setState(() {
                            _selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${locations[_selectedLocationIndex]}",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text("${locations[0]}"),
                              value: 0,
                            ),
                            PopupMenuItem(
                                child: Text(
                                  "${locations[1]}",
                                ),
                                value: 1)
                          ];
                        },
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.settings, color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    " Where would\nyou want to go?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller:
                                TextEditingController(text: locations[0]),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon:Material(
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  child: Icon(Icons.search,color:Colors.black),
                                      

                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 14.0),
                      )),
                      )),
                      SizedBox(height:10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          InkWell(child:ChoiceChip(Icons.flight_takeoff,"Flights",isFlightSelected),onTap:(){ setState(() {
                            isFlightSelected=true;
                          });},),
                          InkWell(child:ChoiceChip(Icons.hotel,"Hotels",!isFlightSelected),onTap: (){setState(() {
                            isFlightSelected=false;
                          });},)
                        ],),
                      
                ],
              ),
            ))
      ],
    );
  }
}
class ChoiceChip extends StatefulWidget {
  IconData icon;
  String text;
  bool isSelected;
  ChoiceChip(this.icon,this.text,this.isSelected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
 

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding:EdgeInsets.only(left:10.0,right: 10.0,top:5.0,bottom: 5.0),
              decoration: BoxDecoration(color:(widget.isSelected)?Colors.white.withOpacity(0.15):Theme.of(context).primaryColor,
              borderRadius:BorderRadius.all(Radius.circular(20.0))
              
              ),
              margin: EdgeInsets.only(left:5.0,right:5.0),
              child:Row(
               children:[Icon(widget.icon,color: Colors.white,),Text('  ${widget.text}',style: TextStyle(color:Colors.white))])
      
    );
  }
}
// class HomeScreenTopBackground extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return CustomPaint(child:Container(
//       // decoration: BoxDecoration(

//       //   gradient: LinearGradient(colors: [firstColor,secondColor])
//       // ),
//       height:500
//     ),painter:MyCustomPainter());
//   }
// }

// class MyCustomPainter extends CustomPainter{
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//       Paint paint=Paint();

//       Path cubicBezierPath=Path();
//       cubicBezierPath.lineTo(0, size.height*0.6);
//       cubicBezierPath.cubicTo(size.width*0.3, size.height*0.4, size.width*0.6,size.height*0.7 , size.width, size.height*0.4);
//       cubicBezierPath.lineTo(size.width,0);
//       paint.color=Colors.orange;
//       canvas.drawPath(cubicBezierPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return null;
//   }

// }
