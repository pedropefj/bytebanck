import 'file:///C:/Alura/flutter/bytebank/lib/screens/dashboard/saldo_card.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBanck'),
      ),
      body: ListView(children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: Text('Receber depósito'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }),
                );
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Nova transferência'),
              onPressed: () {

                final _saldo = Provider.of<Saldo>(
                  context,
                  listen: false,
                ).semSaldo();

                if(_saldo){
                  return false;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FormularioTransferencia();
                  }),
                );
              },
            ),
          ],
        ),
        UltimasTransferencias()
      ]),
    );
  }
}
