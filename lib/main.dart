import 'package:flutter/material.dart';

void main() => runApp(const InvestimentoApp());

class InvestimentoApp extends StatelessWidget {
  const InvestimentoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Investimentos',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const InvestimentoPage(),
      );
}

class InvestimentoPage extends StatefulWidget {
  const InvestimentoPage({super.key});

  @override
  InvestimentoPageState createState() => InvestimentoPageState();
}

class InvestimentoPageState extends State<InvestimentoPage> {
  final _valorCtrl = TextEditingController();
  final _mesesCtrl = TextEditingController();
  final _jurosCtrl = TextEditingController();
  double _semJuros = 0, _comJuros = 0;

  void _simular() {
    final v = double.tryParse(_valorCtrl.text) ?? 0;
    final m = int.tryParse(_mesesCtrl.text) ?? 0;
    final j = double.tryParse(_jurosCtrl.text) ?? 0;
    double total = 0;

    for (int i = 0; i < m; i++) {
      total = (total + v) * (1 + j / 100);
    }

    setState(() {
      _semJuros = v * m;
      _comJuros = j > 0 ? total : _semJuros;
    });
  }

  @override
  void dispose() {
    _valorCtrl.dispose();
    _mesesCtrl.dispose();
    _jurosCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Simulador')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            _campo('Valor mensal', _valorCtrl),
            _campo('Meses', _mesesCtrl),
            _campo('Juros (%)', _jurosCtrl),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _simular, child: const Text('Simular')),
            const SizedBox(height: 20),
            Text('Sem juros: R\$ ${_semJuros.toStringAsFixed(2)}'),
            Text('Com juros: R\$ ${_comJuros.toStringAsFixed(2)}'),
          ]),
        ),
      );

  Widget _campo(String label, TextEditingController c) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          controller: c,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      );
}
