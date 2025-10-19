import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/feature/language/bloc/language_bloc.dart';
import 'package:aunkur_farmer/src/feature/language/presentation/widget/language_select_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  int selectedIndex = 0;
  final List<String> languageList = ["English", "Italian", "Bengali"];
  static const String selectedLanguageKey = 'selectedLanguage';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  // Load the previously selected language from SharedPreferences
  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(selectedLanguageKey);

    setState(() {
      switch (languageCode) {
        case 'en':
          selectedIndex = 0;
          break;
        case 'it':
          selectedIndex = 1;
          break;
        case 'bn':
          selectedIndex = 2;
          break;
        default:
          selectedIndex = 0; // Default to English
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Language")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: SizedBox(
          height: 54,
          child: PrimaryButton(
            title: "Save",
            onTap: () {
              // Dispatch the event based on the selected language
              Locale selectedLocale;

              switch (selectedIndex) {
                case 0:
                  selectedLocale = const Locale('en'); // English
                  break;
                case 1:
                  selectedLocale = const Locale('it'); // Italian
                  break;
                case 2:
                  selectedLocale = const Locale('bn'); // Bengali
                  break;
                default:
                  selectedLocale = const Locale('en'); // Default to English
              }

              context.read<LanguageBloc>().add(ChangeLanguage(selectedLocale));

              Navigator.pop(context, true);
            },
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        itemBuilder: (context, index) {
          return LanguageSelectCart(
            index: index,
            title: languageList[index],
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: listItemGap);
        },
        itemCount: languageList.length,
      ),
    );
  }
}
