import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:todo/todo_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init( document.path);
  Hive.openBox <TodoModel>('Boxname');
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task ToDo',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
       title: Text("Save your TASKS here..."),
       actions: <Widget>[
         PopupMenuButton<String>(
           onSelected: (Value){
             
           },
           itemBuilder: (BuildContext context){
             return["All","Completed","Incompleted"].map((option){
               return PopupMenuItem(
                 value: option,
                 child: Text(option),
             );
             }).toList();
           },
         )
       ],
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         
          showDialog(
            builder: (context) => Dialog(
             child: Container(
               padding: EdgeInsets.all(16),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   TextField(
                     decoration: InputDecoration(hintText: "Title"),
                      controller: titleController,
                   ),
                   SizedBox(
                     height: 8,
                   ),
                   TextField(
                     decoration: InputDecoration(hintText: "Detail"),
                     controller: detailController,
                   ),
                   SizedBox(
                     height: 8,
                   ),
                  TextButton(
                     onPressed: () {  },  
                     child: const Icon(Icons.add),
                     
                    ),
                 ],
               ),
             ),
            ), context: context, 
            );
          }
        ),
        );
  }    
  }