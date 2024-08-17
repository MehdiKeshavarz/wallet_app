import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/styles.dart';
import 'package:flutter_wallet_app/core/widgets/dashbord_container.dart';

class WalletSide extends StatelessWidget {
  const WalletSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          )
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: DashbordContainer(
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}
