import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transfêrencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '100.00';
const _rotuloCampoConta = 'Número conta';
const _dicaCampoConta = '1234';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoConta,
              dica: _dicaCampoConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    final transferenciaValida = _validaTransfrencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context,novaTransferencia,valor);
      Navigator.pop(context);
    }
  }

  _validaTransfrencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;

    final _saldoSuficiente = valor <= Provider.of<Saldo>(
      context,
      listen: false,
    ).valor;

    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, Transferencia novaTransferencia, valor) {

    Provider.of<Saldo>(
      context,
      listen: false,
    ).subtrai(valor);

    Provider.of<Transferencias>(
      context,
      listen: false,
    ).adiciona(novaTransferencia);
  }
}
