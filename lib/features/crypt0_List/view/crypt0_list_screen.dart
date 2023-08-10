import 'dart:async';

import 'package:crypt0/features/crypt0_List/bloc/crypt0_list_bloc.dart';
import 'package:crypt0/features/crypt0_List/widgets/widgets.dart';
import 'package:crypt0/repositories/crypt0_coins/crypt0_coins.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:crypt0/theme/theme.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';

class Crypt0ListScreen extends StatefulWidget {
  const Crypt0ListScreen({super.key, required this.title});

  final String title;

  @override
  State<Crypt0ListScreen> createState() => _Crypt0ListScreenState();
}

class _Crypt0ListScreenState extends State<Crypt0ListScreen> {
  final _crypt0ListBloc = Crypt0ListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _crypt0ListBloc.add(LoadCrypt0List());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: CustomRefreshIndicator(
        builder: MaterialIndicatorDelegate(
          builder: (context, controller) {
            return const Icon(
              BitcoinIcons.bitcoin_circle,
              color: Colors.yellowAccent,
              size: 30,
            );
          },
        ),
        onRefresh: () async {
          final completer = Completer();
          _crypt0ListBloc.add(LoadCrypt0List(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<Crypt0ListBloc, Crypt0ListState>(
          bloc: _crypt0ListBloc,
          builder: (context, state) {
            if (state is Crypt0ListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.white24),
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return Crypt0CoinTile(coin: coin);
                },
              );
            }
            if (state is Crypt0ListLoadingFailed) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: darkTheme.textTheme.bodyMedium,
                    ),
                    Text(
                      'Please try againg later',
                      style: darkTheme.textTheme.labelSmall
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _crypt0ListBloc.add(LoadCrypt0List());
                      },
                      child: const Text(
                        'Try againg',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
                child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [Colors.yellow],
              strokeWidth: 2,
            ));
          },
        ),
      ),

      /*(_crypt0CoinsList == null)
          ? const Center(
              child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [Colors.yellow],
              strokeWidth: 2,
            ))
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _crypt0CoinsList!.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.white24),
              itemBuilder: (context, i) {
                final coin = _crypt0CoinsList![i];
                return Crypt0CoinTile(coin: coin);
              },
            ),*/
    );
  }
}
