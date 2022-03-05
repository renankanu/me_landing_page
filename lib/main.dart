import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/core/config/firebase_config.dart';
import 'app/core/theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: platformOptions,
  );
  await dotenv.load(fileName: '.env');
  initializeDateFormatting();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String token = dotenv.env['GITHUB_TOKEN']!;
    final HttpLink httpLink = HttpLink('https://api.github.com/graphql');
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');

    final Link link = authLink.concat(httpLink);
    final client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),
        link: link,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RenanKanu;',
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        theme: Themes.lightTheme,
      ),
    );
  }
}
