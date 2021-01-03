import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier{
  double valor;

  Saldo(this.valor);

  void adiciona(double valor){
    this.valor += valor;
    notifyListeners();
  }

  bool semSaldo(){
    return valor <= 0;
  }

  void subtrai(double valor){
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString(){
    return 'R\$ $valor';
  }
}