import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int contador = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla del Contador'),
      ),
      body: Center(
        child:Text('Valor: $contador',style: Theme.of(context).textTheme.titleLarge,),
        
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

           contador++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
