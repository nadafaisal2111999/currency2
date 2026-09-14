import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/currency_cubit.dart';
import '../cubit/currency_state.dart';

class CurrencyBody extends StatefulWidget {
  const CurrencyBody({super.key});

  @override
  State<CurrencyBody> createState() => _CurrencyBodyState();
}

class _CurrencyBodyState extends State<CurrencyBody> {
  final TextEditingController amountController = TextEditingController(text: '100');

  String fromCurrency = 'USD';
  String toCurrency = 'EGP';

  final List<String> currencies = ['USD', 'EUR', 'EGP', 'SAR', 'AED', 'GBP'];

  void _swapCurrencies() {
    setState(() {
      final temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // كارت مدخلات التحويل
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // حقل إدخال المبلغ
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'المبلغ المراد تحويله',
                      prefixIcon: const Icon(Icons.attach_money),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // صف اختيار العملات + زر التبديل
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // عملة المصدر
                      Expanded(
                        child: _buildCurrencyDropdown('من', fromCurrency, (val) {
                          if (val != null) setState(() => fromCurrency = val);
                        }),
                      ),

                      // زر التبديل
                      IconButton.filledTonal(
                        onPressed: _swapCurrencies,
                        icon: const Icon(Icons.swap_horiz_rounded, size: 28),
                      ),

                      // عملة الهدف
                      Expanded(
                        child: _buildCurrencyDropdown('إلى', toCurrency, (val) {
                          if (val != null) setState(() => toCurrency = val);
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // زر التحويل المودرن
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        final amount = double.tryParse(amountController.text) ?? 0.0;
                        context.read<CurrencyCubit>().convert(
                          from: fromCurrency,
                          to: toCurrency,
                          amount: amount,
                        );
                      },
                      child: const Text(
                        'تحويل الآن',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // عرض الحالات والنتيجة
          BlocConsumer<CurrencyCubit, CurrencyState>(
            listener: (context, state) {
              if (state is CurrencyFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is CurrencyLoading) {
                return const CircularProgressIndicator();
              } else if (state is CurrencySuccess) {
                return _buildResultCard(state.currency.conversionResult.toStringAsFixed(2));
              }
              return const Text(
                'أدخلي المبلغ واضغطي تحويل لعرض النتيجة',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget فرعي لاختيار العملة
  Widget _buildCurrencyDropdown(String label, String value, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: currencies.map((String code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code, style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  // كارت النتيجة المودرن
  Widget _buildResultCard(String result) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            'المبلغ المحول',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            '$result $toCurrency',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}