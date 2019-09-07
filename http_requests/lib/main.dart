import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
home: HomePage()

));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url ="https://swapi.co/api/people/";

List data;
Future<String> getJsonData() async{
   var response  = await http.get(Uri.encodeFull(url),
   
   headers: {
     'Accept': 'application/json'
   });
   print(response.body);

   setState(() {
     var convertedJsonData = json.decode(response.body);
     data = convertedJsonData['results'];
   });

return "Success";
}
@override
void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView.builder(

        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){

          return new Container(
            child: Center(child: Column(  
              crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[

  Card(  


child:Column(
  children: <Widget>[
        Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
    Container(  
          child: Text( data[index]['name']),
          padding: EdgeInsets.all(15),
    
        ),
         Container( 
          child: Text( data[index]['mass']),
          padding: EdgeInsets.all(15),
        ),
        
    ],),

Container( 
alignment: Alignment.center,
  child: Text(
    data[index]["birth_year"]
  ),
)
  ],
)

),

 
],

            ),),
          );
        },
      ),
   
    );
  }
}