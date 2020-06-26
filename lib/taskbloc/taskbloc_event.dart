import 'package:meta/meta.dart';

@immutable
abstract class TaskblocEvent {}

class GetPostEvent extends TaskblocEvent{}
