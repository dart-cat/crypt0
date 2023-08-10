import 'package:crypt0/repositories/crypt0_coins/models/crypt0_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<Crypt0Coin>> getCoinsList();
  
}
