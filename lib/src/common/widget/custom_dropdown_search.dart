library;

import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/widget/helper.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:flutter/foundation.dart'; // for listEquals
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownSearch extends StatefulWidget {
  final List<CommonModel> items;
  final String labelText;
  final double dropdownHeight;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final ValueChanged<String> onChanged;
  final ValueChanged<CommonModel>? onFieldSubmitted;
  final String? errorText;
  final String? initialValue;
  final bool enabled;

  const CustomDropdownSearch({
    super.key,
    required this.items,
    required this.labelText,
    this.dropdownHeight = 210.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderColor = AppColors.borderColor,
    this.backgroundColor = Colors.white,
    required this.onChanged,
    this.errorText,
    this.onFieldSubmitted,
    this.initialValue,
    this.enabled = true,
  });

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isDropdownVisible = false;
  List<CommonModel> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    _focusNode.addListener(() {
      if (!mounted) return;
      setState(() {
        _isDropdownVisible = _focusNode.hasFocus && widget.enabled;
      });
    });
  }

  @override
  void didUpdateWidget(covariant CustomDropdownSearch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(oldWidget.items, widget.items)) {
      setState(() {
        _filteredItems = widget.items;
        _isDropdownVisible = false;

        final text = _controller.text;
        final stillExists = _filteredItems.any((e) => e.name == text);
        if (!stillExists) {
          _controller.clear(); // ⬅️ clear only if selection vanished
          widget.onChanged('');
        }
      });
    }

    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    if (oldWidget.enabled != widget.enabled && mounted) {
      setState(() {
        if (!widget.enabled) _isDropdownVisible = false;
      });
    }
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        final q = query.toLowerCase();
        _filteredItems = widget.items
            .where((i) => i.name.toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showDropdown = _isDropdownVisible && _filteredItems.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: widget.enabled,
          focusNode: _focusNode,
          controller: _controller,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: AppColors.primary,
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            errorText: widget.errorText,
            errorStyle: GoogleFonts.hindSiliguri(
              fontSize: 12,
              color: AppColors.primaryRead,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: GoogleFonts.hindSiliguri(
              fontSize: 16,
              color: AppColors.primaryBlack.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
            hintStyle: GoogleFonts.hindSiliguri(
              fontSize: 16,
              color: const Color(0xffA9A9A9),
              fontWeight: FontWeight.w400,
            ),
            helperStyle: GoogleFonts.hindSiliguri(
              fontSize: 16,
              color: const Color(0xffA9A9A9),
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.4)),
            ),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: const BorderSide(color: Color(0xFFF6F6F6), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: const BorderSide(color: AppColors.primaryRead),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: const BorderSide(color: AppColors.primaryRead),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                showDropdown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
              onPressed: !widget.enabled
                  ? null
                  : () {
                      setState(() {
                        if (showDropdown) {
                          _focusNode.unfocus();
                          _isDropdownVisible = false;
                        } else {
                          _focusNode.requestFocus();
                          _isDropdownVisible = true;
                          // Refresh filter when opening
                          _filterItems(_controller.text);
                        }
                      });
                    },
            ),
          ),
          onChanged: (value) {
            _filterItems(value);
            widget.onChanged(value);
          },
        ),
        if (showDropdown)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              constraints: BoxConstraints(maxHeight: widget.dropdownHeight),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: widget.borderRadius,
                color: widget.backgroundColor,
              ),
              child: _filteredItems.isEmpty
                  ? AppHelper.emptyView()
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return ListTile(
                          title: Text(
                            item.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onTap: () {
                            setState(() {
                              _controller.text = item.name;
                              _focusNode.unfocus();
                              _isDropdownVisible = false;
                            });
                            widget.onChanged(item.name);
                            widget.onFieldSubmitted?.call(item);
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        color: AppColors.borderColor,
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}
