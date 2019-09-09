import 'package:flutter/material.dart';

class Pessoa{

  double peso;
  double altura;
  String genero;
  double imc;
  Color cor;


  void setPeso(double peso){
    this.peso = peso;
  }

  void setAltura(double altura){
    this.altura = altura;
  }

  void setGenero(String genero){
    this.genero = genero;
  }

  String calcula(){
    double weight = peso;
    double height = altura / 100.0;
    this.imc = weight / (height * height);

    return this.imc.toStringAsPrecision(2);
        
  }

  String classifica(){

    if (genero == "masculino"){
      if (imc < 20.7)
      {
        this.cor = Colors.black;    
        return "Abaixo do peso";
      }      
      else if (imc >= 20.7 && imc < 26.5)
      {
        this.cor = Colors.green;
        return "Peso ideal";
      }      
      else if (imc >= 26.5 && imc < 27.9)       
      {
        this.cor = Colors.yellow;
        return "Pouco acima do peso";
      }      
      else if (imc >= 27.9 && imc < 31.2)      
      {
        this.cor = Colors.orange;
        return "Acima do peso";
      }      
      else if (imc > 31.1)
      {
        this.cor = Colors.red;      
        return "Obesidade";    
      }      
    }
    else{
      if (imc < 19.1)       
      {
        this.cor = Colors.black;    
        return "Abaixo do peso";
      } 
      else if (imc >= 19.1 && imc < 25.9)
      {
        this.cor = Colors.green;
        return "Peso ideal";
      }
      else if (imc >= 25.9 && imc < 27.4)
      {
        this.cor = Colors.yellow;
        return "Pouco acima do peso";
      }
      else if (imc >= 27.4 && imc < 32.4)
      {
        this.cor = Colors.orange;
        return "Acima do peso";
      } 
      else if (imc > 32.5)
      {
        this.cor = Colors.red;      
        return "Obesidade";    
      }      
      
    }
  }

  Color getCor(){
    return cor;     
  }


}




