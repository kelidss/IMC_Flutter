

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}


class _HomeState extends State <Home> {
  final TextEditingController _idadeControl = new TextEditingController();
  final TextEditingController _alturaControl = new TextEditingController();
  final TextEditingController _pesoControl = new TextEditingController();
  double resultado = 0.0;
  // ignore: unused_field
  String _resultadoFinal = "";
  String _resultadoConsulta = "";

  void _calcularIMC() {
  setState(() {
    int idade = int.parse(_idadeControl.text);
    double altura = double.parse(_alturaControl.text);
    double peso = double.parse(_pesoControl.text);

    
        if((_idadeControl.text.isNotEmpty || idade > 0)
          && (_alturaControl.text.isNotEmpty)
          && (_pesoControl.text.isNotEmpty || peso > 0)) {
            resultado = peso /(altura * altura);
          
    if (double.parse(resultado.toStringAsFixed(1)) < 16){
              _resultadoConsulta = 'baixo peso muito grave';

   } else if (double.parse(resultado.toStringAsFixed(1)) >= 16.0 && resultado <= 16.99){
              _resultadoConsulta = 'baixo peso grave';

    }else if (double.parse(resultado.toStringAsFixed(1)) >= 17.0 &&  resultado < 18.49){
             _resultadoConsulta = 'baixo peso';

   } else if (double.parse(resultado.toStringAsFixed(1)) >= 18.50 &&  resultado < 24.99){
             _resultadoConsulta = 'peso normal';

    } else if (double.parse(resultado.toStringAsFixed(1)) >= 25.0 &&  resultado < 29.99){
             _resultadoConsulta = 'sobre peso';

    }  else if (double.parse(resultado.toStringAsFixed(1)) >= 30.0 &&  resultado < 34.99){
             _resultadoConsulta = 'obesidade de primeiro grau';

    } else if (double.parse(resultado.toStringAsFixed(1)) >= 35.0 &&  resultado < 39.99){
             _resultadoConsulta = 'obesidade de segundo grau';

    } else if (double.parse(resultado.toStringAsFixed(1)) >= 40.0 ){
             _resultadoConsulta = 'obesidade mórbida';
    } else resultado = 0.0;
} 

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IMC',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 50, 192),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            Image.asset(
              'assets/gym2.jpg',
              height: 300,
              width: 100,
            ),
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              //color: Color.fromARGB(255, 228, 85, 85),
              child: Column(
                children: <Widget>[
                   TextField(
                    keyboardType: TextInputType.number,
                    controller: _idadeControl,
                    decoration: InputDecoration(
                        labelText: 'idade',
                        hintText: '..',
                        icon: Icon(Icons.sports_gymnastics)),
                  ),
                   TextField(
                    keyboardType: TextInputType.number,
                    controller: _alturaControl,
                    decoration: InputDecoration(
                        labelText: 'altura',
                        hintText: '...',
                        icon: Icon(Icons.height)),
                  ),
                   TextField(
                    keyboardType: TextInputType.number,
                    controller: _pesoControl,
                    decoration: InputDecoration(
                      labelText: 'peso',
                      hintText: '...',
                      icon: Icon(Icons.people),
                      //labelStyle: TextStyle(
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _calcularIMC,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 34, 50, 192),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('calcular'),
                  ),
                ],
              ),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${resultado.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 56, 241),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                )
              ],
              ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("$_resultadoConsulta",
                    style: TextStyle(
                       color: Color.fromARGB(255, 88, 94, 89),
                      fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9
             ),),
                  )
               ],
            )
          //]
        ),
      );
  }
}
