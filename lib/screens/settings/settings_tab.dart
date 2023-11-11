import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/screens/settings/show_bottom_sheet/show_language_bottom_sheet.dart';
import 'package:todo_application/screens/settings/show_bottom_sheet/show_theming_bottom_sheet.dart';
import 'package:todo_application/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 12),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.background,
                  )),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    provider.local == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primary)),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          InkWell(
            onTap: () {
              showThemingBottomSheet();
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 12),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.background,
                  )),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    provider.theme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primary)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          )),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          )),
      builder: (context) {
        return ThemingBottomSheet();
      },
    );
  }
}
