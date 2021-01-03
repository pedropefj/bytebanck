import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/material.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencias => _transferencias;

  adiciona(Transferencia novaTransferencias){
    _transferencias.add(novaTransferencias);
    notifyListeners();
  }
}
