import 'package:blocpatternapibyzx/network/api_provider_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

//import 'UI/bloc_home.dart';
import 'UI/bloc_library_home.dart';
import 'taskbloc/taskbloc_bloc.dart';

void main() {
  //_setupLogging();
  runApp(MyApp());
}

//void _setupLogging(){
 // Logger.level=Level.debug;
  
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context)=> ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiservice,child){
          return BlocProvider<TaskblocBloc>(
            create: (context)=>TaskblocBloc(apiservice),
            child: new MaterialApp(
              home:BlocHomeNoRetrofit()
            ),
          );
        }
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//   return Provider(
//      create: (context)=> ApiService.create(),
//      child: MaterialApp(
//        home:BlocHomeNoRetrofit()
//      ),
//    );
// }
//}
