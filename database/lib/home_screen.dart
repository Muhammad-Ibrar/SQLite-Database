import 'package:database/db_helper.dart';
import 'package:database/notes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('SQL Notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          dbHelper!.insert(
            NotesModel(
                title: 'Note',
                age: 23,
                description: 'This is sql practice',
                email: 'muhammadibrar@gmail.com'
            )
          ).then((value){
            print('Data is Added');
          }).onError((error, stackTrace){
            print(error.toString());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}