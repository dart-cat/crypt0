// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crypt0_list_bloc.dart';

abstract class  Crypt0ListEvent extends Equatable{}


class LoadCrypt0List extends Crypt0ListEvent {
  
  LoadCrypt0List({
    this.completer,
  });
  final Completer? completer;
  
  @override
  
  List<Object?> get props => [completer];
}
