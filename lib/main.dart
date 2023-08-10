import 'package:crypt0/repositories/crypt0_coins/abstract_coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypt0app.dart';
import 'repositories/crypt0_coins/crypt0_coins_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => Crypt0CoinsRepository(dio: Dio()));
  runApp(const Crypt0App());
}
