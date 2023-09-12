import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          //usando gorouter
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
   final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding( //despegar botones de los bordes
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10, //propiedad para que los botones no esten pegados
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated ')),
            const ElevatedButton(onPressed: null , child: Text('Elevated Disable')),
            ElevatedButton.icon(onPressed: (){},
             icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_new),label: const Text('Filled Icon'),),
            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal), label:const Text('Outline Icon')),
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.text_fields_outlined), label: const Text('TextBut Icon')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){},
             icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
            ),),
            //Todo:CurstomButton
          
          const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la paleta de colores del tema actual.
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      // Aplicar un borde redondeado alrededor del botón.
      borderRadius: BorderRadius.circular(20),
      child: Material(
        // Establecer el color de fondo del Material del botón.
        color: colors.primary,
        child: InkWell(
          onTap: () {
            // Lógica que se ejecuta cuando se toca el botón.
          },
          child: const Padding(
            // Agregar un relleno horizontal y vertical alrededor del texto.
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(
                color: Colors.white, // Establecer el color del texto.
              ),
            ),
          ),
        ),
      ),
    );
  }
}

