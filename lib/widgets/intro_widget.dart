import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          localizations.welcomeTitle,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/local_image.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 24),
            Image.network(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=facearea&w=400&h=400',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
