import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 248, 236, 128),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                color: Color.fromARGB(110, 255, 255, 255),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            scaffoldBackgroundColor: const Color.fromARGB(66, 80, 80, 80),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(66, 114, 114, 114),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                )),
            dividerColor: Colors.white12,
            listTileTheme: const ListTileThemeData(iconColor: Colors.white)),
        routes: {
          '/': (context) => const CryptoListScreen(),
          '/coin': (context) => const CryptoCoinScreen(),
        },
      ),
    );

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

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
        centerTitle: true,
      ),
    );
  }
}
