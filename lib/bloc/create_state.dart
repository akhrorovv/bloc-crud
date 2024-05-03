import 'package:equatable/equatable.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object?> get props => [];
}

class CreateInitialState extends CreateState {}

class CreateLoadingState extends CreateState {}

class CreateSuccessState extends CreateState {
  final String message;

  const CreateSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateErrorState extends CreateState {
  final String errorMessage;

  const CreateErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
