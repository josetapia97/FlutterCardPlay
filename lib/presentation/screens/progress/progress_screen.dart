import 'package:flutter/material.dart';

class ProgressScren extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progres Incidcators'),
      ),
      body: const _ProgressView(),
      
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Progreso Circular'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 20),
          Text('Indicador de progreso circular controlado'),
          _ControledProgressIndicator()
          ],
      ),
    );
  }
}

class _ControledProgressIndicator extends StatelessWidget {
  const _ControledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}