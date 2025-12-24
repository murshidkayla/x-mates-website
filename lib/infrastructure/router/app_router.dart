import 'package:flutter/material.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/privacy_policy_page.dart';
import '../../presentation/pages/terms_conditions_page.dart';
import '../../presentation/pages/contact_page.dart';
import '../../presentation/pages/how_to_delete_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    
    switch (settings.name) {
      case '/':
        page = const HomePage();
        break;
      case '/privacy-policy':
        page = const PrivacyPolicyPage();
        break;
      case '/terms-conditions':
        page = const TermsConditionsPage();
        break;
      case '/contact':
        page = const ContactPage();
        break;
      case '/how-to-delete':
        page = const HowToDeletePage();
        break;
      default:
        page = const HomePage();
    }

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Smooth fade + slide transition
        const begin = Offset(0.0, 0.02);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}





