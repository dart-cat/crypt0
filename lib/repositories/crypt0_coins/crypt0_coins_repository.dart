// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'crypt0_coins.dart';

class Crypt0CoinsRepository implements AbstractCoinsRepository {
  
  Crypt0CoinsRepository({
    required this.dio,
  });
  
final Dio dio;


  @override
  Future<List<Crypt0Coin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD,EUR');
    //для наглядности 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD'
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final crypt0CoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return Crypt0Coin(
        name: e.key,
        priceUSD: price,
        imageURL: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return crypt0CoinsList;
  }
}
