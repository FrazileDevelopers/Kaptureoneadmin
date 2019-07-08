import 'package:flutter/material.dart';
import '../widget/auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.auth, this.onSingedOut});
  final BaseAuth auth;
  final VoidCallback onSingedOut;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSingedOut();
    } catch (e) {
      print(e);
    }
  }

  List<String> items = ['My Orders', 'Location', 'Profile', 'Notifications'];

  List<Widget> drawerItems() => items != null
      ? items
          .map(
            (ditems) => ListTile(
              title: Text(
                ditems,
              ),
            ),
          )
          .toList()
      : <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          )
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.scaleDown,
            height: 32,
          ),
          // centerTitle: true,
          actions: <Widget>[
            // CustomAppbar(),
            // FlatButton(onPressed: _signOut, child: Text("Logout")),
            new IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _signOut,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
            child: Form(
                child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? "Photography Name can't be empty" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: "Enter Photography's Name",
                contentPadding: EdgeInsets.all(8.0),
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: 'Pacifico'), 
              ),
              maxLength: 120,
            )
          ],
        ))));
  }
}
