import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorUI extends StatelessWidget {
  final TextEditingController firstNumerController;
  final TextEditingController secondNumerController;
  final String result;
  final Function(double, double, String) onCalculate;

  const CalculatorUI(
      {Key? key,
      required this.firstNumerController,
      required this.secondNumerController,
      required this.result,
      required this.onCalculate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildTextField('Angka Pertama', firstNumerController),
                      const SizedBox(height: 20.0),
                      _buildTextField('Angka Kedua', secondNumerController),
                      const SizedBox(height: 20.0),
                      _buildButtons(),
                      const SizedBox(height: 20.0),
                      Text(
                        'Hasil: $result',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget _buildTextField(String lableText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      style: const TextStyle(fontSize: 24, color: Colors.white),
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () => onCalculate(
                double.parse(firstNumerController.text) ?? 0,
                double.parse(secondNumerController.text) ?? 0,
                'add'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: const Text(
              'Tambah',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () => onCalculate(
                double.parse(firstNumerController.text) ?? 0,
                double.parse(secondNumerController.text) ?? 0,
                'subtract'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: const Text(
              'Kurang',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
