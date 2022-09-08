import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:validacep/view_models/view_model_search.dart';
import '../views/details_view.dart';

class ResultWidget extends StatefulWidget {
  ResultWidget({Key? key, required this.viewModel}) : super(key: key);
  ViewModelSearch viewModel;
  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.viewModel.loader
            ? const CircularProgressIndicator()
            : Text(
                widget.viewModel.result,
                style: TextStyle(
                    color: widget.viewModel.result == 'CEP Válido!'
                        ? Colors.green
                        : const Color.fromARGB(224, 194, 33, 33),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
        widget.viewModel.result == 'CEP Válido!'
            ? Column(
                children: [
                  SizedBox(height: 40, child: Lottie.asset('assets/images/arrow.json')),
                  GestureDetector(
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: const Color.fromARGB(224, 194, 33, 33))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Mostrar dados ',
                            style: TextStyle(
                                fontSize: 16, color: Color.fromARGB(255, 230, 117, 25)),
                          ),
                          Icon(
                            Icons.double_arrow_sharp,
                            color: Color.fromARGB(224, 194, 33, 33),
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      await widget.viewModel.validationInicialCEP()
                          ? Navigator.of(context).pushNamed(
                              DetailsView.pageName,
                            )
                          : '';
                    },
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
