import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;

class StartPage extends StatefulWidget{
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlareActor(
            'assets/start.flr',
            fit: BoxFit.cover,
            animation: 'rest',
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0,left: 100.0,bottom: 50.0),
            child: Text("Tata Usaha",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),)
          ),
          FutureBuilder (
            future: getData(),
            builder: (context, snapshot){
              print (snapshot.data);
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ?
              new ItemList(list: snapshot.data) :
              new Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Future getData() async{
    final response = await http.get("https://tatausaha222.000webhostapp.com/get.php");

    return json.decode(response.body);
  }

}

class ItemList extends StatelessWidget
{
  final list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: new ListView.builder(
        padding: EdgeInsets.only(top: 120.0,right: 10.0,left: 10.0),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i){
          return Card(
            color: Colors.white,
            child: new ListTile(
              title: new Text(list[i]['nama_rayon'].toString(),style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: "arial"),),
              subtitle: Text(list[i]['pembimbing'].toString(),style: TextStyle(fontSize: 10,color: Colors.black87,fontFamily: "arial"),),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.clear)
              ),
            ),
          );
        }
      ),
    );
  }
}
