import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {

  final VoidCallback? onTryAgain;

  const EmptyList({super.key, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
          onTap: onTryAgain,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Nenhum local disponível, clique para tentar novamente"),
          ),
        ));
  }
}
