import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff2a93ce),
              Color(0xff00b8b8),
            ],
          ),
        ),
        child: FlutterLogo(),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Smart Parking App"),
        centerTitle: true,
      ),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('UserName'),
            accountEmail: Text('user@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.account_circle,
                  size: 70.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  @override
  String teks;
  ProfileTile(String teks) {
    this.teks = teks;
  }
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 275,
              child: Center(
                child: Text(
                  teks,
                  textScaleFactor: 1.45,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Icon(
              Icons.account_circle,
              color: Colors.grey,
              size: 150.0,
            ),
          ),
        ),
        ProfileTile('Username: User'),
        ProfileTile('Email: user@gmail.com'),
        ProfileTile('No. Telp: 08XXXXXXXXXX'),
        ProfileTile('User ID: 1609XXXXXX'),
      ]),
    );
  }
}
