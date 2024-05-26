import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaxplus/JsonModels/users.dart';
import 'package:vaxplus/components/inventory.dart';
import 'package:vaxplus/components/reports.dart';
import 'package:vaxplus/components/schedule.dart';
import 'package:vaxplus/vax/login.dart';

class Dashboard extends StatefulWidget {
  final Users? profile;
  const Dashboard({super.key, this.profile});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late DateTime selected;
  _showDateTimePicker() async {
    selected = (await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    ))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title : Text("Dashboard"),
        backgroundColor: Colors.blueGrey,

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_active), onPressed: () {
            showAlertDialog(context);
            },
          ),
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItemSchedule("Schedule", Icons.schedule),
            makeDashboardItemInventory("Inventory", Icons.inventory),
            makeDashboardItemReport("Reports", Icons.report_problem),    
            makeDashboardItemNotifications("Notifications", Icons.notifications_none)
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(25, 110, 0, 0),
              child: Text("WELCOME TO DASHBOARD", style: const TextStyle(fontSize: 20.0, color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading:Icon(Icons.person,color: Colors.blueGrey),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileRoute()),
                );
              },
            ),

            ListTile(
              leading:Icon(Icons.power_settings_new,color: Colors.blueGrey),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("Dismiss"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notifications"),
      content: Text("Your Notifications Will Apperar Here! \n\nYou Can Dismiss And Click Ok Flat Button."),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

/*  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
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
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }*/
  Card makeDashboardItemSchedule(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScheduleScreen()),
              );
            },
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
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemNotifications(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsRoute()),
              );
            },
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
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemInventory(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventoryScreen()),
              );
            },
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
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemReport(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()),
              );
            },
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
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}

 FlatButton({required Text child, required Null Function() onPressed}) {
}

class ProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imgUrl = '';
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
        backgroundColor: Colors.white,
        body: new Center(
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 25,),
              new CircleAvatar(radius:75<75? 75:75,backgroundImage: NetworkImage(imgUrl),),
              new SizedBox(height: 25,),
              new Text('Jenver Lara  \jiboylara500@gmail.com', style: new TextStyle(fontWeight: FontWeight.bold, fontSize:25, color: Colors.black),
                textAlign: TextAlign.center,),
            ],
          ),
        )
    );
  }
}

class NotificationsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Text('Notifications Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center,),
      ),
    );
  }
}

  




