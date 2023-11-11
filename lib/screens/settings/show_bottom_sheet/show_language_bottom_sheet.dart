import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/shared/styles/colors.dart';
import '../../../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: provider.local == "en" ? primary : black)),
                provider.local == "en"
                    ? Icon(
                        Icons.done,
                        color: primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Arabic",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: provider.local == "ar" ? primary : black)),
                provider.local == "ar"
                    ? Icon(
                        Icons.done,
                        color: primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
