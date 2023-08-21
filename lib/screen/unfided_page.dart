// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';

class UnfindedPage extends StatelessWidget {
  UnfindedPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustoTextFormField(
          controller: _controller,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
              ),
              const Text(
                "Not Found",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("Não foi possivel achar este perfil"),
        ],
      ),
    );
  }
}
