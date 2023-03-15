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
  late  Future<List<NotesModel>> notesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData () async {
    // notesList = dbHelper!.getNotesList();
    notesList = dbHelper!.getNotesList();
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
          Expanded(
            child: FutureBuilder(
              future: notesList,
                builder: (context ,AsyncSnapshot<List<NotesModel>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                    itemBuilder: (context , index) {
                      return  Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(snapshot.data![index].title.toString()),
                          subtitle: Text(snapshot.data![index].description.toString()),
                          trailing: Text(snapshot.data![index].age.toString()),
                        ),
                      );
                    }
                );

                }
            ),
          )
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