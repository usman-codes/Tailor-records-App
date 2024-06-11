import 'package:darzi_app/screens/Allcustomer.dart';
import 'package:darzi_app/screens/Allorders.dart';
import 'package:darzi_app/screens/newcustomer.dart';
import 'package:darzi_app/screens/neworder.dart';
import 'package:darzi_app/screens/setting.dart';
import 'package:darzi_app/widgets/custom%20widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  final List<Widget> children = [
    HomeScreen(),
    AllCustomersScreen(),
    AllOrdersScreen(),
    SettingsScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.deeppurpleColor,
      ),
      body: currentindex == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(3.0),
                  children: <Widget>[
                    makeDashboardItem(
                        "New Customer", Icons.person_add, Appcolors.redColor,
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewCustomerScreen()));
                    }),
                    makeDashboardItem(
                        "New Order", Icons.add_box, Appcolors.deeppurpleColor,
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewOrderScreen()));
                    }),
                    makeDashboardItem(
                        "All Customer", Icons.people, Appcolors.blueColor, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCustomersScreen()));
                    }),
                    makeDashboardItem("All Orders", Icons.list_alt_outlined,
                        Appcolors.purpleColor, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllOrdersScreen()));
                    }),
                  ],
                ),
              ),
            )
          : children[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'All Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentindex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        backgroundColor: Colors.white, // Change this to the desired color
      ),
    );
  }
}

Card makeDashboardItem(
    String title, IconData icon, Color color, VoidCallback onTap) {
  return Card(
      // elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: color,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}
