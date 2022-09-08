import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/view_model_search.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String pageName = '/details';
  @override
  State<DetailsView> createState() => _DetailsState();
}

class _DetailsState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    ViewModelSearch viewModelSearch = Provider.of<ViewModelSearch>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('KLab'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: heigth * 0.8,
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(224, 194, 33, 33),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child:  Text(
                    viewModelSearch.inputCep.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 360,
                  width: 470,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 150,
                      color: const Color.fromARGB(224, 194, 33, 33),
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
                        height: heigth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Estado:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Cidade:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Bairro:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Rua:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  viewModelSearch.dataCep[0]['state'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  viewModelSearch.dataCep[0]['city'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  viewModelSearch.dataCep[0]['district'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 150,
                                  child: AutoSizeText(
                                    viewModelSearch.dataCep[0]['address'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.visible),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
