import 'package:flutter/widgets.dart';
import 'package:protto_assignment/Models/CoinModel.dart';
import 'package:protto_assignment/data.dart';

class Coins with ChangeNotifier {
  List<CoinModel> _myCoins = [];

  List<CoinModel> _allCoins = [];
  bool _error = false;
  bool loading = false;
  String _errorMessage = '';
  List<CoinModel> x = [];

  List<CoinModel> get myCoins => _myCoins;

  List<CoinModel> get allCoins => _allCoins;

  bool get error => _error;

  String get errorMessage => _errorMessage;

  Future<void> get fetchMyCoins async {
    _myCoins = [];

    final response = await Future.delayed(const Duration(seconds: 1), () {
      print('delayed execution');
      return portfolioData();
    });

    try {
      for (var c in response['data']) {
        CoinModel coin = CoinModel();
        coin.image = c['image'];
        coin.title = c['title'];
        coin.amount = c['amount'];
        coin.percentage = c['percentage'];
        coin.sign = c['sign'];
        _myCoins.add(coin);
      }
      _error = false;
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
      _myCoins = [];
    }
    notifyListeners();
  }

  Future<void> get coinsList async {
    _allCoins = [];
    final response = await Future.delayed(const Duration(seconds: 1), () {
      print('delayed execution');
      return jsonData();
    });
    try {
      for (var c in response['data']) {
        CoinModel coin = CoinModel();
        coin.image = c['image'];
        coin.title = c['title'];
        coin.subtitle = c['subtitle'];
        coin.amount = c['amount'];
        coin.percentage = c['percentage'];
        coin.sign = c['sign'];
        _allCoins.add(coin);
      }
      _error = false;
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
      _allCoins = [];
    }
    notifyListeners();
  }
}
