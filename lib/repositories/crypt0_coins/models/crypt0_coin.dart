// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Crypt0Coin extends Equatable {
  const Crypt0Coin({
    required this.name,
    required this.priceUSD,
    required this.imageURL,
  });
  final String name;
  final double priceUSD;
  final String imageURL;



  @override
  List<Object> get props => [name, priceUSD, imageURL];
}
