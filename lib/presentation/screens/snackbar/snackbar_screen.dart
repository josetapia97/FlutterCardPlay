import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: const Text('Holanda k talca'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
       builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Aute nulla ullamco magna anim. Ad labore in esse magna laborum aute dolore sint eu minim aute proident eiusmod ex. Anim incididunt eiusmod tempor ipsum amet. Sint officia dolore aliquip enim proident incididunt eiusmod veniam laboris est exercitation duis cupidatat. Consequat Lorem sunt magna incididunt reprehenderit exercitation consequat in tempor cillum. Nisi est nisi ad irure laboris labore labore excepteur id ad commodo nulla sunt nulla.'),
       actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        FilledButton(onPressed: () => context.pop() , child: const Text('Aceptar')),
       ],
       ),
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Duis cillum do velit irure. Aliqua ullamco aute nisi pariatur qui labore qui. Aliquip velit minim laboris do laboris cupidatat aute adipisicing culpa adipisicing. Cupidatat aliqua non non amet elit deserunt est qui cupidatat id non eu eu mollit.')
                  ]);
                },
                child: const Text('Licencias Usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context), child: const Text('Mostrar Diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
