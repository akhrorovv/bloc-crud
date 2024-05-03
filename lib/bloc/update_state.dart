import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/post_model.dart';

@immutable
abstract class UpdateState extends Equatable {}

class UpdateInitialState extends UpdateState {
  late final Post post;

  @override
  List<Object> get props => [post];
}

