import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/auth/auth_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Selector<AuthProvider, String>(
        selector: (context, authProvider) =>
            authProvider.user?.displayName ?? 'Não informado',
        builder: (_, value, __) {
          return Text(
            'E aí, $value!',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          );
        },
      ),
    );
  }
}
