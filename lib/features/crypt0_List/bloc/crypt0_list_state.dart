// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crypt0_list_bloc.dart';

 abstract class Crypt0ListState extends Equatable{}

class Crypt0ListInitial extends Crypt0ListState {
  @override
  
  List<Object?> get props => [];
}

class Crypt0ListLoading extends Crypt0ListState {
  @override
  
  List<Object?> get props => [];
}

class Crypt0ListLoaded extends Crypt0ListLoading {
  Crypt0ListLoaded({
    required this.coinsList,
  });
  final List<Crypt0Coin> coinsList;

  @override
  
  List<Object?> get props => coinsList;
}

class Crypt0ListLoadingFailed extends Crypt0ListState {
  
  Crypt0ListLoadingFailed({
    this.exception,
  });
  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}
