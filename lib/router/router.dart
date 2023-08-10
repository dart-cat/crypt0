import '../features/crypt0_List/crypt0_list.dart';
import '../features/crypt0_coin/crypt0_coin.dart';

final routes = {
  '/' : (context) => const Crypt0ListScreen(title: 'Crypt0'),
  '/coin' : (context)=> const Crypt0CoinScreen(),
};