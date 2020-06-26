import 'package:blocpatternapibyzx/network/model/task_model.dart';
import 'package:blocpatternapibyzx/taskbloc/bloc.dart';
import 'package:blocpatternapibyzx/taskbloc/taskbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BlocHomeNoRetrofit extends StatefulWidget {
  @override
  _BlocHomeNoRetrofitState createState() => _BlocHomeNoRetrofitState();
}

class _BlocHomeNoRetrofitState extends State<BlocHomeNoRetrofit> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        title:Text("Bloc Library Get api Data")
      ),
      body: new SafeArea(
        child:Column(
          children:<Widget>[
            Expanded(
              child: BlocBuilder<TaskblocBloc, TaskblocState>(
                builder:(context,state){
                  if(state is InitialTaskblocState){
                    return Container(
                      child: new Center(
                        child:Text('TO GET DATA Click LOAD!')
                      ),
                    );
                  }
                  if(state is PostLoadingState){
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                  if(state is ErrorState){
                    return Container(
                      child: Center(child: Text("$state.error"),),
                    );
                  }
                  if(state is GetPostState){
                    return _listPosts(state.userModels);
                  }
                  return null;
                }),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        BlocProvider.of<TaskblocBloc>(context)..add(GetPostEvent());
      },child:Text("LOAD")),
    );
  }
  
   ListView _listPosts(List<UserModel> models){
    return ListView.builder(
        itemCount:models.length,
        itemBuilder: (BuildContext context, int index) {
          final id = models[index].id;
          return Card(
            child: ListTile(
              leading: Text(id.toString()),
              title: Text(models[index].title),
              subtitle: Text(models[index].body),
            ),
          );
        }
    ); 
   }
}
