// ignore_for_file: deprecated_member_use

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/utils/mask_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

extension EmptySpace on num {
  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get widthBox => SizedBox(width: toDouble());
}

const scaffoldDefaultPadding = 16.0;
const textLineGap = 4.0;
const listItemGap = 8.0;

const double stripeChargePercentage = 1.5;
const double stripeChargeFixed = 0.25;
const double wequiChargeFixed = 0.20;

// Transection type
const int transactionPending = 1;
const int transactionTopUp = 2;
const int transactionRefund = 3;
const int transactionPurchase = 4;
const int transectionSubscription = 5;

// Payment method
const int paymentMethodCard = 1;
const int paymentMethodWallet = 2;

const double textfieldgap = 14.0;

FilteringTextInputFormatter decimalPlaceBinding =
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

// Empty Screen Widget
Widget emptyScreenWidget({
  String title = "No Data Found",
  String description =
      "There’s nothing to show right now. Please check back later.",
  String buttonText = "Reload",
  VoidCallback? onAction,
}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration or placeholder image
          SizedBox(
            height: 160,
            width: 160,
            child: SvgPicture.asset(
              AppAssets.emptyViewSVG,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(navigatorKey.currentContext!).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Action button (optional)
          // Circular Action Button
          if (onAction != null)
            InkWell(
              onTap: onAction,
              borderRadius: BorderRadius.circular(50),
              splashColor: AppColors.primary.withOpacity(0.3),
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.refresh, color: Colors.white, size: 26),
              ),
            ),
        ],
      ),
    ),
  );
}

Widget errorPageWidget({
  String title = "Something went wrong",
  String description = "Please check your connection or try again later.",
  VoidCallback? onRetry,
}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Optional image or illustration
          SizedBox(
            height: 160,
            width: 160,
            child: SvgPicture.asset(
              AppAssets.alertSVG, // your error image asset
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              navigatorKey.currentContext!,
            ).textTheme.titleMedium?.copyWith(color: Colors.red),
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Retry Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 2,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onRetry,
            child: const Text(
              "Try Again",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Loading page widget
Widget loadingPageWidget() {
  return const Center(
    child: CircularProgressIndicator(color: AppColors.primary),
  );
}



var maskFormate = MaskTextInputFormatter(
  mask: '(+88) #####-###-###',
  filter: {"#": RegExp(r'[0-9]')},
);

// List of langugae
List<LanguageModel> languageList = [
  LanguageModel(
    id: 1,
    name: "বাংলা",
    code: "bn",
    countryFlag: AppAssets.bangladeshFlag,
    country: "Bangladesh",
  ),
  LanguageModel(
    id: 2,
    name: "English",
    code: "en",
    countryFlag: AppAssets.unitedStatesFlag,
    country: "United States",
  ),
];

String getProfileItem(int index) {
  switch (index) {
    case 0:
      return S.current.changePassword;
    // case 1:
    //   return S.current.biometric;
    case 1:
      return S.current.language;
    case 2:
      return S.current.termsAndConditions;
    case 3:
      return S.current.rateUs;

    default:
      return "N/N";
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.black26,
        shape: BoxShape.circle,
      ),
    );
  });
}

// Land type by id
String getLandTypeById(int id) {
  switch (id) {
    case 1:
      return S.current.highland;
    case 2:
      return S.current.mediumHighland;
    case 3:
      return S.current.mediumLowland;
    case 4:
      return S.current.lowland;

    default:
      return S.current.noData;
  }
}

// Soil texture by id
String getSoilTextureById(int id) {
  switch (id) {
    case 1:
      return S.current.sandySoil;
    case 2:
      return S.current.siltSoil;
    case 3:
      return S.current.claySoil;
    case 4:
      return S.current.loamySoil;
    default:
      return S.current.noData;
  }
}
