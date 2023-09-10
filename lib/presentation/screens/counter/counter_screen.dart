import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

class CounterScreen extends StatelessWidget {
  static const name = "counter_river";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen')
      ),
      
      body: Center(
        child: Text("Valor: 10",style: Theme.of(context).textTheme.titleLarge,),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}