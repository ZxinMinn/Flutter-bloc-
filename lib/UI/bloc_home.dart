import 'package:blocpatternapibyzx/network/api_provider_service.dart';
import 'package:blocpatternapibyzx/network/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Api Read With JSON ANNOTATION")
      ),
      body: _listFutureTasks(context),
      //floatingActionButton: FloatingActionButton(
       // onPressed: (){
        // final apidata=Provider.of<ApiService>(context,listen: false);
        //  apidata.getPosts().then((value) => value.forEach((item) { 
           
        //  }));
        //  print(apidata);
        //},
       //child: Icon(Icons.plus_one),
      //),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context){
    return FutureBuilder<List<UserModel>>(
      future: Provider.of<ApiService>(context, listen: false).getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(
                  child:Text("Something Wrong")
                ),
              );
            }
            final posts=snapshot.data;
            return _posts(context: context, posts: posts);
          }
          else{
              return Container(
               child:Center(child:CircularProgressIndicator()),
              );
            }
        }
      );
  }

  ListView _posts({BuildContext context,List<UserModel>posts}){
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context,int index){
        return Card(
          child: Container(
            child:ListTile(
              leading:Text(
                posts[index].id.toString(),
                style: TextStyle(color:Colors.black87,fontWeight:FontWeight.bold,fontSize:18),
              ) ,
              title: Text( 
                posts[index].title,
                style: TextStyle(color:Colors.black87,fontWeight:FontWeight.bold,fontSize:16),
                ),
              subtitle: Text(
                posts[index].body,
                style: TextStyle(color:Colors.black87,fontWeight:FontWeight.normal,fontSize:14),
                ),
            )
          ),
        );
      }
    );
  }
}
