import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

/// A custom widget that combines a label and a checkbox in a single row.
///
/// This widget allows for a checkbox and a label that can be tapped together to change the checkbox state.
///
/// The [LabeledCheckbox] widget is highly customizable:
/// - You can provide a label string to describe the checkbox.
/// - You can bind the checkbox state to a boolean value.
/// - You can provide a callback function that triggers when the checkbox is toggled.
class LabeledCheckbox extends StatelessWidget {
  /// Creates a [LabeledCheckbox].
  ///
  /// The [label], [value], and [onChanged] parameters must not be null.
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  /// The text label displayed next to the checkbox.
  final String label;

  /// The current state of the checkbox. If true, the checkbox is checked.
  final bool value;

  /// The callback function triggered when the checkbox is toggled.
  ///
  /// This function passes the new value of the checkbox when it is tapped.
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value); // Toggle the value when the widget is tapped.
      },
      child: Row(
        children: [
          Checkbox(
            visualDensity: // Set the visual density of the checkbox.
            const VisualDensity(
              horizontal: -4,
              vertical: -4,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            value: value,
            onChanged: (value) {
              onChanged(
                value!,
              ); // Pass the new value when checkbox state changes.
            },
            activeColor:
                AppColors.primary, // Set the active color of the checkbox.
          ),
          Text(
            label, // Display the provided label text.
            style: Theme.of(context)
                .textTheme
                .bodyMedium, // Use the bodyMedium style from the current theme.
          ),
        ],
      ),
    );
  }
}
