import "package:flutter/material.dart";
class CustomAppBar extends StatelessWidget {
  List<BottomNavigationBarItem> bottomBarItems=[
    BottomNavigationBarItem(icon: Icon(Icons.explore),title: Text("Explore",style: TextStyle(color: Colors.black),)),
    BottomNavigationBarItem(icon:Icon(Icons.favorite),title:Text("Wishlist",style: TextStyle(color: Colors.black)),),
    BottomNavigationBarItem(icon:Icon(Icons.local_offer),title:Text("Deals",style: TextStyle(color: Colors.black))),
    BottomNavigationBarItem(icon:Icon(Icons.notifications),title:Text("Notification",style: TextStyle(color: Colors.black)))
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
          child: BottomNavigationBar(
        items:bottomBarItems,
        currentIndex: 0,
        unselectedItemColor: Colors.black,
        iconSize: 25.0,
        selectedItemColor: Theme.of(context).primaryColor,
        type:BottomNavigationBarType.fixed
      ),
    );
  }
}