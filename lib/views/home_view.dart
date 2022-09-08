import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validacep/main.dart';
import 'package:validacep/view_models/view_model_search.dart';
import 'package:validacep/widgets/custom_textfield.dart';
import '../widgets/widget_result.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String pageName = '/home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    ViewModelSearch viewModelSearch = Provider.of<ViewModelSearch>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('KLab'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                  activeColor: Colors.black,
                  value: themeOption.value == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      themeOption.value = value ? ThemeMode.dark : ThemeMode.light;
                    });
                  }),
              const Text(
                ' Modo Dark',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 10)
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: heigth * 0.9,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(224, 194, 33, 33),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'VALIDA CEP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              CustomTextField(
                viewModel: viewModelSearch,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.clear_all_outlined,
                      color: Colors.orange,
                    ),
                    TextButton(
                      autofocus: true,
                      onPressed: () {
                        viewModelSearch.result = '';
                        viewModelSearch.inputCep.text = '';
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      child: const Text('Limpar...'),
                    ),
                  ],
                ),
              ),
              viewModelSearch.inputCep.text.isEmpty
                  ? Container()
                  : ResultWidget(viewModel: viewModelSearch),
              const Spacer(),
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                   await viewModelSearch.validationInicialCEP();
               
                  },
                  child: const Text(
                    'Buscar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const Spacer(),
            ]),
          ),
        ),
      ),
    );
  }
}
