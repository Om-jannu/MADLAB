import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madlab1/pages/login.dart';
// import './pages/list.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Future _initializeFirebase() async{
    FirebaseApp firebaseApp =  await Firebase.initializeApp();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Login();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
