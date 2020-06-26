import 'package:blocpatternapibyzx/network/model/task_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TaskblocState {}

class InitialTaskblocState extends TaskblocState {}

class PostLoadingState extends TaskblocState{
}

class GetPostState extends TaskblocState{
  final List<UserModel> userModels;
  GetPostState(this.userModels);
}

class ErrorState extends TaskblocState{
  final String error;
  ErrorState(this.error);
}
