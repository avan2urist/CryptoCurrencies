import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
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
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset('assets/svg/bitcoin.svg',
                height: 35, width: 35),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed('/coin', arguments: coinName);
            },
            subtitle: Text(
              '20000\$',
              style: theme.textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}