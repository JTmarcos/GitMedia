import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final TextEditingController _controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Git media",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Procure seu primeiro Git",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustoTextFormField(
              controller: _controller,
              
                
              
            )
          ),
        ],
      ),
    );
  }
}
