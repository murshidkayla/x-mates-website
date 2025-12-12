import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/privacy_policy_page.dart';
import 'presentation/pages/terms_conditions_page.dart';
import 'presentation/pages/contact_page.dart';
import 'presentation/pages/how_to_delete_page.dart';
import 'application/providers/navigation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'X Matez',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/privacy-policy': (context) => const PrivacyPolicyPage(),
          '/terms-conditions': (context) => const TermsConditionsPage(),
          '/contact': (context) => const ContactPage(),
          '/how-to-delete': (context) => const HowToDeletePage(),
        },
        ),
    );
  }
}
