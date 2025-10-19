import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ComposerBar extends StatefulWidget {
  const ComposerBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSend,
    this.isSending = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final bool isSending;

  @override
  State<ComposerBar> createState() => ComposerBarState();
}

class ComposerBarState extends State<ComposerBar> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _hasText = widget.controller.text.trim().isNotEmpty;
    widget.controller.addListener(_onChanged);
  }

  void _onChanged() {
    final v = widget.controller.text.trim().isNotEmpty;
    if (v != _hasText && mounted) setState(() => _hasText = v);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border(top: BorderSide(color: cs.outlineVariant, width: 0.6)),
      ),
      padding: EdgeInsets.fromLTRB(
        12,
        8,
        12,
        8 + MediaQuery.viewInsetsOf(context).bottom * 0,
      ),
      child: Row(
        children: [
          // Text field chip
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withOpacity(.6),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: cs.outlineVariant, width: 0.6),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 140),
                child: Scrollbar(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,

                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,

                      hintText: 'Message',
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                    onSubmitted: (_) => widget.onSend(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Send button
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: _hasText ? AppColors.primary : cs.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: cs.outlineVariant, width: 0.6),
              boxShadow: [
                if (_hasText)
                  BoxShadow(
                    color: cs.primary.withOpacity(.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: _hasText ? cs.onPrimary : cs.onSurfaceVariant,
                size: 20,
              ),
              onPressed: _hasText && !widget.isSending ? widget.onSend : null,
              tooltip: 'Send',
            ),
          ),
        ],
      ),
    );
  }
}
