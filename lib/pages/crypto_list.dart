import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCurrenciesList'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          leading:
              SvgPicture.asset('assets/svg/bitcoin.svg', height: 35, width: 35),
          title: Text(
            'Bitcoin',
            style: theme.textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> CryptoCoinScreen(),
              ),
            );
          },
          subtitle: Text(
            '20000\$',
            style: theme.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}



class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BitCoin'),
        centerTitle: true,
      ),
    );
  }
}

