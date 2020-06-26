import 'dart:async';
import 'dart:io';
//import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:blocpatternapibyzx/network/api_provider_service.dart';
import './bloc.dart';

class TaskblocBloc extends Bloc<TaskblocEvent, TaskblocState> {

  final ApiService api;
  TaskblocBloc(this.api);

  @override
  TaskblocState get initialState => InitialTaskblocState();

  @override
  Stream<TaskblocState> mapEventToState(
    TaskblocEvent event,
  ) async* {
    if(event is GetPostEvent){
      yield PostLoadingState();
      try{
        final response=await api.getPosts();
        yield GetPostState(response);
      }on SocketException catch(e){
        yield ErrorState(e.message);
      }on Exception catch(ex){
        print(ex);
      }
    }
  }
}
