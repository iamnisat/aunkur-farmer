/* =========================
   Message bubble (refined)
   ========================= */

import 'dart:math' as math;

import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/widget/status_icon.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.time,
    required this.isMe,
    required this.status,
    this.onLongPress,
  });

  final String text;
  final DateTime time;
  final bool isMe;
  final MessageStatus status;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // Subtle, classy colour palette
    final bg = isMe
        ? _blend(cs.primary, cs.surface, 0.12)
        : cs.surfaceContainerHighest.withOpacity(.6);
    final border = isMe
        ? cs.primary.withOpacity(.25)
        : cs.outlineVariant.withOpacity(.6);
    final fg = isMe ? cs.onSurface : cs.onSurface;

    final radius = BorderRadius.only(
      topLeft: const Radius.circular(14),
      topRight: const Radius.circular(14),
      bottomLeft: Radius.circular(isMe ? 14 : 0),
      bottomRight: Radius.circular(isMe ? 0 : 14),
    );

    return Padding(
      padding: EdgeInsets.only(
        top: 6,
        bottom: 6,
        left: isMe ? 48 : 8,
        right: isMe ? 8 : 48,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: math.min(MediaQuery.of(context).size.width * 0.78, 520),
        ),
        child: InkWell(
          borderRadius: radius,
          onLongPress: onLongPress,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: border, width: 0.8),
              borderRadius: radius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isMe ? 0.08 : 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 10, 6),
              child: Column(
                crossAxisAlignment: isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: fg,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(time),
                        style: TextStyle(
                          color: cs.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                      if (isMe) ...[
                        const SizedBox(width: 6),
                        StatusIcon(status: status),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _blend(Color a, Color b, double t) {
    return Color.fromARGB(
      (a.alpha * t + b.alpha * (1 - t)).round(),
      (a.red * t + b.red * (1 - t)).round(),
      (a.green * t + b.green * (1 - t)).round(),
      (a.blue * t + b.blue * (1 - t)).round(),
    );
  }

  String _formatTime(DateTime t) {
    final hh = t.hour % 12 == 0 ? 12 : t.hour % 12;
    final mm = t.minute.toString().padLeft(2, '0');
    final ampm = t.hour >= 12 ? 'PM' : 'AM';
    return '$hh:$mm $ampm';
  }
}
