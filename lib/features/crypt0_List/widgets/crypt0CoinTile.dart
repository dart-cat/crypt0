
import 'package:crypt0/repositories/crypt0_coins/models/crypt0_coin.dart';
import 'package:flutter/material.dart';


class Crypt0CoinTile extends StatelessWidget {
  const Crypt0CoinTile({super.key, required this.coin});

  final Crypt0Coin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageURL
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('${coin.priceUSD}\$', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}