import 'package:calculadora_imc/pessoa.dart';
import 'package:flutter/material.dart';

//enum SingingCharacter { masculino, feminino }
String _character = "masculino";

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _result;
  String _imc;
  Color _color;
  Pessoa pessoa = new Pessoa();


  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _imc = 'Informe seus dados';
      _result = '';
      _color = Colors.black;
    });
  }

  void calculateImc() {

    setState(() {
      pessoa.setPeso(double.parse(_weightController.text));
      pessoa.setAltura(double.parse(_heightController.text));
      pessoa.setGenero(_character);

      _imc    = "IMC: " + pessoa.calcula();
      _result = pessoa.classifica();
      _color = pessoa.getCor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso (kg)'),
                      controller: _weightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu peso!" : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      controller: _heightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua altura!" : null;
                      },
                    ),
                    ListTile(
                              title: const Text('Masculino'),
                              leading: Radio(
                                value: "masculino",
                                groupValue: _character,
                                onChanged: (String value) {
                                  setState(() { _character = value; });
                                },
                              ),
                            ),
                    ListTile(
                              title: const Text('Feminino'),
                              leading: Radio(
                                value: "feminino",
                                groupValue: _character,
                                onChanged: (String value) {
                                  setState(() { _character = value; });
                                },
                              ),
                            ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),                      
                      child: Text(
                        _imc, 
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),                      
                      child: Text(
                        _result, 
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: _color)
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  calculateImc();
                                }
                              },
                              child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
                            ))),                    
                            
                  ],
                ))));
  }
}
