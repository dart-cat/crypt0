import 'dart:async';

import 'package:crypt0/repositories/crypt0_coins/crypt0_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypt0_list_event.dart';
part 'crypt0_list_state.dart';

class Crypt0ListBloc extends Bloc<Crypt0ListEvent, Crypt0ListState> {
  Crypt0ListBloc(this.coinsRepository) : super(Crypt0ListInitial()) {
    on<LoadCrypt0List>((event, emit) async {
      try {
        if (state is! Crypt0ListLoaded) {
          emit(Crypt0ListLoading());
        }
        final crypt0List = await coinsRepository.getCoinsList();
        emit(Crypt0ListLoaded(coinsList: crypt0List));
      } catch (e) {
        emit(Crypt0ListLoadingFailed(exception: e));
      } finally {
        event.completer!.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
