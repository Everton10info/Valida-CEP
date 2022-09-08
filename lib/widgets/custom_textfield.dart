import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validacep/view_models/view_model_search.dart';
import 'package:brasil_fields/brasil_fields.dart';
class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.viewModel}) : super(key: key);

  ViewModelSearch viewModel;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      width: 320,
      child: TextFormField(
         inputFormatters: [
    // obrigatório
    FilteringTextInputFormatter.digitsOnly,
    CepInputFormatter(ponto: false),
  ],
        maxLength: 10,
        key: widget.viewModel.formKey,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 19,
        ),
        validator: ((String? value) {
          if (value == null || value.isEmpty) {
            return ' Digite um CEP!';
          }
          return null;
        }),
        controller: widget.viewModel.inputCep,
        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(224, 194, 33, 33)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelStyle: TextStyle(color: Color.fromARGB(224, 194, 33, 33)),
            labelText: 'CEP',
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.orange,
            ),
            suffixIcon: Icon(Icons.place)),
      ),
    );
  }
}
