import "package:flutter/material.dart";
class CityCard extends StatelessWidget {
  final String imagePath,oldPrice,newPrice,discount,city,monthYear;
  CityCard({this.imagePath,this.oldPrice,this.newPrice,this.discount,this.city,this.monthYear});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
  
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),  
                  child: Stack(children:[
                 Container(
                    height:height*0.25,
                    width:160.0,
                    child: Image.asset(imagePath,fit:BoxFit.cover),
                  ),
                  Positioned(
                    bottom:0,
                    left:0,
                    height:80.0,
                    width:160.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end:Alignment.topCenter,
                          colors:[Colors.black,Colors.black.withOpacity(0.1)]
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: <Widget>[
                      Text('${city}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                      Text(monthYear,style:TextStyle(color:Colors.white,fontSize: 14.0))
                   
                      ],),
                      Container(child:Text('$discount%',style:TextStyle(color:Colors.black,fontSize: 14.0)),
                      padding: EdgeInsets.symmetric(vertical:6.0,horizontal: 10.0),
                      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      )
                    ],),
                    bottom:10.0,
                    right:10.0,
                    left:10.0
                  )
                ],
              )),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text('\$${newPrice}',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(width:10.0),
                Text('(\$${oldPrice})',style:TextStyle(color:Colors.black26,fontSize: 14.0))
              ],
            ))  
          ],
        ),
    );
  }
}