import 'package:flutter/material.dart';
import 'package:shared_preference_child_to_parent/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var userName = '';
  var mobileNo = '';

  @override
  void initState() {

    super.initState();

    getAllData();
  }

  getAllData() async {

    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('username') ?? '';
    mobileNo = prefs.getString('mobileNo') ?? '';


    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              mobileNo,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: (){

              print('username--------->${userName}');
              print('mobileNo-------->${mobileNo}');

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SecondScreen();
              }));

            }, child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}
