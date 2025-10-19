import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  const StatusIcon({super.key, required this.status});
  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    switch (status) {
      case MessageStatus.sending:
        return SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.6,
            valueColor: AlwaysStoppedAnimation<Color>(cs.onSurfaceVariant),
          ),
        );
      case MessageStatus.sent:
        return Icon(Icons.check, size: 16, color: cs.onSurfaceVariant);
      case MessageStatus.delivered:
        return Icon(Icons.done_all, size: 16, color: cs.onSurfaceVariant);
      case MessageStatus.read:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Colors.lightBlueAccent,
        );
      case MessageStatus.failed:
        return Icon(Icons.error_outline, size: 16, color: cs.error);
    }
  }
}
