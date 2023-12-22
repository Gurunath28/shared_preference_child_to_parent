import 'package:flutter/material.dart';
import 'package:shared_preference_child_to_parent/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final userNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Parent Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'Enter User Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: mobileNoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    prefixIcon: Icon(Icons.call),
                    labelText: 'Enter Mobile No',
                    hintText: 'Enter Your Mobile No'

                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async {
                FocusScope.of(context).unfocus();
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('username', userNameController.text);
                await prefs.setString('mobileNo', mobileNoController.text);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FirstScreen();
                }));
              }, child: Text('send'))
            ],
          ),
        ),
      ),
    );
  }
}
