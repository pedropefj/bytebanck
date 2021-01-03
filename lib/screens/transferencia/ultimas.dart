import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Últimas transfrencias';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final ultimasTransferencias =
              transferencias.transferencias.toList().reversed.toList();
          final _quantidade = transferencias.transferencias.length;

          if(_quantidade == 0){
            return SemTransferenciaCadastrada();
          }

          final _tamanho = _quantidade < 3
              ? _quantidade
              : 2;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(ultimasTransferencias[indice]);
            },
          );
        }),
        RaisedButton(
          color: Colors.green,
          child: Text('Ver todas as transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }),
            );
          },
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
