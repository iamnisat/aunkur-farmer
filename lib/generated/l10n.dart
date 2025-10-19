// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `iPAGE`
  String get appTitle {
    return Intl.message('iPAGE', name: 'appTitle', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Service Agent`
  String get serviceAgent {
    return Intl.message(
      'Service Agent',
      name: 'serviceAgent',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotpass {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotpass',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message('LOGIN', name: 'login', desc: '', args: []);
  }

  /// `Aunkur`
  String get aunkur {
    return Intl.message('Aunkur', name: 'aunkur', desc: '', args: []);
  }

  /// `aeQuilibrium inside`
  String get aeQuilibriumInside {
    return Intl.message(
      'aeQuilibrium inside',
      name: 'aeQuilibriumInside',
      desc: '',
      args: [],
    );
  }

  /// `iPAGE GLOBAL INC.`
  String get iPAGEGLOBALINC {
    return Intl.message(
      'iPAGE GLOBAL INC.',
      name: 'iPAGEGLOBALINC',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcome {
    return Intl.message('Welcome Back!', name: 'welcome', desc: '', args: []);
  }

  /// `Farmers`
  String get myFarmers {
    return Intl.message('Farmers', name: 'myFarmers', desc: '', args: []);
  }

  /// `Weather`
  String get weather {
    return Intl.message('Weather', name: 'weather', desc: '', args: []);
  }

  /// `Farm Operation`
  String get farmOperation {
    return Intl.message(
      'Farm Operation',
      name: 'farmOperation',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get partner {
    return Intl.message('Partner', name: 'partner', desc: '', args: []);
  }

  /// `Crops`
  String get crops {
    return Intl.message('Crops', name: 'crops', desc: '', args: []);
  }

  /// `Training`
  String get training {
    return Intl.message('Training', name: 'training', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Sync Server`
  String get sync {
    return Intl.message('Sync Server', name: 'sync', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Other Info`
  String get otherInfo {
    return Intl.message('Other Info', name: 'otherInfo', desc: '', args: []);
  }

  /// `Upcoming Feature`
  String get upcomingFeature {
    return Intl.message(
      'Upcoming Feature',
      name: 'upcomingFeature',
      desc: '',
      args: [],
    );
  }

  /// `24 Hour Weather Graph`
  String get hour24WeatherGraph {
    return Intl.message(
      '24 Hour Weather Graph',
      name: 'hour24WeatherGraph',
      desc: '',
      args: [],
    );
  }

  /// `Please add any comments or questions you may have`
  String get addCommentsQuestions {
    return Intl.message(
      'Please add any comments or questions you may have',
      name: 'addCommentsQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Add Digital Literacy`
  String get addDigitalLiteracy {
    return Intl.message(
      'Add Digital Literacy',
      name: 'addDigitalLiteracy',
      desc: '',
      args: [],
    );
  }

  /// `Add Farmer's Picture`
  String get addFarmerPicture {
    return Intl.message(
      'Add Farmer\'s Picture',
      name: 'addFarmerPicture',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Informative Farmer Registration`
  String get addNewFarmer {
    return Intl.message(
      'Informative Farmer Registration',
      name: 'addNewFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Quick Farmer Registration`
  String get quickNewFarmer {
    return Intl.message(
      'Quick Farmer Registration',
      name: 'quickNewFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `  Add Summary  `
  String get addSummary {
    return Intl.message(
      '  Add Summary  ',
      name: 'addSummary',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Agent Name & ID`
  String get agentInfo {
    return Intl.message(
      'Agent Name & ID',
      name: 'agentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Agri Insurance`
  String get agriInsurance {
    return Intl.message(
      'Agri Insurance',
      name: 'agriInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Air Pre : `
  String get airPre {
    return Intl.message('Air Pre : ', name: 'airPre', desc: '', args: []);
  }

  /// `Amt Kg/Acre`
  String get amountKg {
    return Intl.message('Amt Kg/Acre', name: 'amountKg', desc: '', args: []);
  }

  /// `Approximate Cost of Production : `
  String get apxCostTotal {
    return Intl.message(
      'Approximate Cost of Production : ',
      name: 'apxCostTotal',
      desc: '',
      args: [],
    );
  }

  /// `Apx. Qty.`
  String get apxQuantity {
    return Intl.message('Apx. Qty.', name: 'apxQuantity', desc: '', args: []);
  }

  /// `Area`
  String get area {
    return Intl.message('Area', name: 'area', desc: '', args: []);
  }

  /// `Cultivated land area `
  String get areaOfLand {
    return Intl.message(
      'Cultivated land area ',
      name: 'areaOfLand',
      desc: '',
      args: [],
    );
  }

  /// `Area of land shouldn't be empty`
  String get areaOfLandShouldntBeEmpty {
    return Intl.message(
      'Area of land shouldn\'t be empty',
      name: 'areaOfLandShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `BaroMin : `
  String get baroMin {
    return Intl.message('BaroMin : ', name: 'baroMin', desc: '', args: []);
  }

  /// `Borrow money from FnF`
  String get borrowMoneyFromFnF {
    return Intl.message(
      'Borrow money from FnF',
      name: 'borrowMoneyFromFnF',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get both {
    return Intl.message('Both', name: 'both', desc: '', args: []);
  }

  /// `Business`
  String get business {
    return Intl.message('Business', name: 'business', desc: '', args: []);
  }

  /// `Bussiness income field shouldn't be empty`
  String get bussinessIncomeFieldShouldnTBeEmpty {
    return Intl.message(
      'Bussiness income field shouldn\'t be empty',
      name: 'bussinessIncomeFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Button Phone`
  String get buttonPhone {
    return Intl.message(
      'Button Phone',
      name: 'buttonPhone',
      desc: '',
      args: [],
    );
  }

  /// `By chemical herbicides`
  String get byChemicalHerbicidesSpecifyWhatDoUse {
    return Intl.message(
      'By chemical herbicides',
      name: 'byChemicalHerbicidesSpecifyWhatDoUse',
      desc: '',
      args: [],
    );
  }

  /// `By mechanical weeding (tillage,mowing and or manual)`
  String get byMechanicalWeedingTillageMowingAndOrManual {
    return Intl.message(
      'By mechanical weeding (tillage,mowing and or manual)',
      name: 'byMechanicalWeedingTillageMowingAndOrManual',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Chemical Name`
  String get chemicalName {
    return Intl.message(
      'Chemical Name',
      name: 'chemicalName',
      desc: '',
      args: [],
    );
  }

  /// `Chemical management`
  String get chemicalManagement {
    return Intl.message(
      'Chemical management',
      name: 'chemicalManagement',
      desc: '',
      args: [],
    );
  }

  /// `Chemical name field shouldn't be empty`
  String get chemicalNameFieldShouldnTBeEmpty {
    return Intl.message(
      'Chemical name field shouldn\'t be empty',
      name: 'chemicalNameFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Chilli`
  String get chilli {
    return Intl.message('Chilli', name: 'chilli', desc: '', args: []);
  }

  /// `Do you have any need for cold storage?`
  String get coldStorage {
    return Intl.message(
      'Do you have any need for cold storage?',
      name: 'coldStorage',
      desc: '',
      args: [],
    );
  }

  /// `Cold Storage Service`
  String get coldStorageService {
    return Intl.message(
      'Cold Storage Service',
      name: 'coldStorageService',
      desc: '',
      args: [],
    );
  }

  /// `Do you need a combined service that includes?`
  String get combinedService {
    return Intl.message(
      'Do you need a combined service that includes?',
      name: 'combinedService',
      desc: '',
      args: [],
    );
  }

  /// `Comments or questions`
  String get commentsOrQuestions {
    return Intl.message(
      'Comments or questions',
      name: 'commentsOrQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Please add any comments or questions you may have`
  String get commentsYouHave {
    return Intl.message(
      'Please add any comments or questions you may have',
      name: 'commentsYouHave',
      desc: '',
      args: [],
    );
  }

  /// `Communication`
  String get communication {
    return Intl.message(
      'Communication',
      name: 'communication',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get companyName {
    return Intl.message('Company', name: 'companyName', desc: '', args: []);
  }

  /// `Cost per bigha`
  String get costperbigha {
    return Intl.message(
      'Cost per bigha',
      name: 'costperbigha',
      desc: '',
      args: [],
    );
  }

  /// `Cost of Production`
  String get costProduction {
    return Intl.message(
      'Cost of Production',
      name: 'costProduction',
      desc: '',
      args: [],
    );
  }

  /// `Crop`
  String get crop {
    return Intl.message('Crop', name: 'crop', desc: '', args: []);
  }

  /// `Crop Name`
  String get cropName {
    return Intl.message('Crop Name', name: 'cropName', desc: '', args: []);
  }

  /// `Crop Protection`
  String get cropProtection {
    return Intl.message(
      'Crop Protection',
      name: 'cropProtection',
      desc: '',
      args: [],
    );
  }

  /// `Capture Image`
  String get captureImage {
    return Intl.message(
      'Capture Image',
      name: 'captureImage',
      desc: '',
      args: [],
    );
  }

  /// `Crops form field shouldn't be empty`
  String get cropsFormFieldShouldnTBeEmpty {
    return Intl.message(
      'Crops form field shouldn\'t be empty',
      name: 'cropsFormFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Crops not Selected`
  String get cropsNotSelected {
    return Intl.message(
      'Crops not Selected',
      name: 'cropsNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `Data is not available --->>>`
  String get dataIsNotAvailableArrow {
    return Intl.message(
      'Data is not available --->>>',
      name: 'dataIsNotAvailableArrow',
      desc: '',
      args: [],
    );
  }

  /// `Data is not available`
  String get dataIsNotAvailable {
    return Intl.message(
      'Data is not available',
      name: 'dataIsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Data Unavailable`
  String get dataUnavailable {
    return Intl.message(
      'Data Unavailable',
      name: 'dataUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Date: `
  String get date {
    return Intl.message('Date: ', name: 'date', desc: '', args: []);
  }

  /// `Date input should not be empty`
  String get dateInputShouldNotBeEmpty {
    return Intl.message(
      'Date input should not be empty',
      name: 'dateInputShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Day Labour`
  String get dayLabour {
    return Intl.message('Day Labour', name: 'dayLabour', desc: '', args: []);
  }

  /// `Day labour salary field shouldn't be empty`
  String get dayLabourSalaryFieldShouldnTBeEmpty {
    return Intl.message(
      'Day labour salary field shouldn\'t be empty',
      name: 'dayLabourSalaryFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Device Id :`
  String get deviceId {
    return Intl.message('Device Id :', name: 'deviceId', desc: '', args: []);
  }

  /// `Digital Literacy & Community Engagement`
  String get digitalLiteracyTilte {
    return Intl.message(
      'Digital Literacy & Community Engagement',
      name: 'digitalLiteracyTilte',
      desc: '',
      args: [],
    );
  }

  /// `Directly retail customer.`
  String get directlyRetailCustomer {
    return Intl.message(
      'Directly retail customer.',
      name: 'directlyRetailCustomer',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message('District', name: 'district', desc: '', args: []);
  }

  /// `District not selected`
  String get districtShouldNotBeEmpty {
    return Intl.message(
      'District not selected',
      name: 'districtShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message('Division', name: 'division', desc: '', args: []);
  }

  /// `Division not selected`
  String get divisionShouldNotBeEmpty {
    return Intl.message(
      'Division not selected',
      name: 'divisionShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Do not get at all`
  String get doNotGetAtAll {
    return Intl.message(
      'Do not get at all',
      name: 'doNotGetAtAll',
      desc: '',
      args: [],
    );
  }

  /// `Dose & apply`
  String get doseApplication {
    return Intl.message(
      'Dose & apply',
      name: 'doseApplication',
      desc: '',
      args: [],
    );
  }

  /// `Do you have other occupations?`
  String get doYouhaveOtherOccupations {
    return Intl.message(
      'Do you have other occupations?',
      name: 'doYouhaveOtherOccupations',
      desc: '',
      args: [],
    );
  }

  /// `eC`
  String get eC {
    return Intl.message('eC', name: 'eC', desc: '', args: []);
  }

  /// `Probable range 0 - 10`
  String get eC_range {
    return Intl.message(
      'Probable range 0 - 10',
      name: 'eC_range',
      desc: '',
      args: [],
    );
  }

  /// `EC shouldn't be empty`
  String get eCShouldntBeEmpty {
    return Intl.message(
      'EC shouldn\'t be empty',
      name: 'eCShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Moisture`
  String get moisture {
    return Intl.message('Moisture', name: 'moisture', desc: '', args: []);
  }

  /// `Probable range 0 - 100`
  String get moisture_range {
    return Intl.message(
      'Probable range 0 - 100',
      name: 'moisture_range',
      desc: '',
      args: [],
    );
  }

  /// `Moisture shouldn't be empty`
  String get moistureShouldntBeEmpty {
    return Intl.message(
      'Moisture shouldn\'t be empty',
      name: 'moistureShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature_key {
    return Intl.message(
      'Temperature',
      name: 'temperature_key',
      desc: '',
      args: [],
    );
  }

  /// `Probable range -40 : 80`
  String get temperature_range {
    return Intl.message(
      'Probable range -40 : 80',
      name: 'temperature_range',
      desc: '',
      args: [],
    );
  }

  /// `Temperature shouldn't be empty`
  String get temperatureShouldntBeEmpty {
    return Intl.message(
      'Temperature shouldn\'t be empty',
      name: 'temperatureShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message('Education', name: 'education', desc: '', args: []);
  }

  /// `Elementary to less than high school`
  String get elementaryToLessThanHighSchool {
    return Intl.message(
      'Elementary to less than high school',
      name: 'elementaryToLessThanHighSchool',
      desc: '',
      args: [],
    );
  }

  /// `Empty Data`
  String get emptyData {
    return Intl.message('Empty Data', name: 'emptyData', desc: '', args: []);
  }

  /// `Empty Field`
  String get emptyField {
    return Intl.message('Empty Field', name: 'emptyField', desc: '', args: []);
  }

  /// `Empty Username or Password`
  String get emptyUserNamePass {
    return Intl.message(
      'Empty Username or Password',
      name: 'emptyUserNamePass',
      desc: '',
      args: [],
    );
  }

  /// `Enter Date`
  String get enterDate {
    return Intl.message('Enter Date', name: 'enterDate', desc: '', args: []);
  }

  /// `An error has occurred!`
  String get errorOccurred {
    return Intl.message(
      'An error has occurred!',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Error while saving data. Try again...`
  String get errorWhileSavingDataTryAgain {
    return Intl.message(
      'Error while saving data. Try again...',
      name: 'errorWhileSavingDataTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experienceInAgriculture {
    return Intl.message(
      'Experience',
      name: 'experienceInAgriculture',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get year {
    return Intl.message('Years', name: 'year', desc: '', args: []);
  }

  // skipped getter for the 'taka/month' key

  /// `Experience field should not be empty`
  String get experienceShouldNotBeEmpty {
    return Intl.message(
      'Experience field should not be empty',
      name: 'experienceShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Do they use Internet?`
  String get familyInternet {
    return Intl.message(
      'Do they use Internet?',
      name: 'familyInternet',
      desc: '',
      args: [],
    );
  }

  /// `Does other family member use smartphone?`
  String get familySmartphone {
    return Intl.message(
      'Does other family member use smartphone?',
      name: 'familySmartphone',
      desc: '',
      args: [],
    );
  }

  /// `Family Type`
  String get familyType {
    return Intl.message('Family Type', name: 'familyType', desc: '', args: []);
  }

  /// `Family type not selected`
  String get familyTypeNotSelcted {
    return Intl.message(
      'Family type not selected',
      name: 'familyTypeNotSelcted',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Helpline Number`
  String get farmerHelpLineNameOrNumber {
    return Intl.message(
      'Farmer Helpline Number',
      name: 'farmerHelpLineNameOrNumber',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Helpline Detail`
  String get farmerHelpLineNumberDetail {
    return Intl.message(
      'Farmer Helpline Detail',
      name: 'farmerHelpLineNumberDetail',
      desc: '',
      args: [],
    );
  }

  /// `Do you know any farmer \nhelpline numbers?\n`
  String get farmerHelplineNumbers {
    return Intl.message(
      'Do you know any farmer \nhelpline numbers?\n',
      name: 'farmerHelplineNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Name`
  String get farmerName {
    return Intl.message('Farmer Name', name: 'farmerName', desc: '', args: []);
  }

  /// `Farmers Club field Shoudn't be empty`
  String get farmersClubFieldShoudnTBeEmpty {
    return Intl.message(
      'Farmers Club field Shoudn\'t be empty',
      name: 'farmersClubFieldShoudnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Are you a member of any farmers’ club cooperative?`
  String get farmersClubmember {
    return Intl.message(
      'Are you a member of any farmers’ club cooperative?',
      name: 'farmersClubmember',
      desc: '',
      args: [],
    );
  }

  /// `Farmer's family use internet field shouldn't be blank`
  String get farmerSFamilyUseInternetFieldShouldnTBeBlank {
    return Intl.message(
      'Farmer\'s family use internet field shouldn\'t be blank',
      name: 'farmerSFamilyUseInternetFieldShouldnTBeBlank',
      desc: '',
      args: [],
    );
  }

  /// `Farmer's family use smartphone field shouldn't be blank`
  String get farmerSFamilyUseSmartphoneFieldShouldnTBeBlank {
    return Intl.message(
      'Farmer\'s family use smartphone field shouldn\'t be blank',
      name: 'farmerSFamilyUseSmartphoneFieldShouldnTBeBlank',
      desc: '',
      args: [],
    );
  }

  /// `Farmer's internet use field shouldn't be blank`
  String get farmerSInternetUseFieldShouldnTBeBlank {
    return Intl.message(
      'Farmer\'s internet use field shouldn\'t be blank',
      name: 'farmerSInternetUseFieldShouldnTBeBlank',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Problems`
  String get farmersProblems {
    return Intl.message(
      'Farmer Problems',
      name: 'farmersProblems',
      desc: '',
      args: [],
    );
  }

  /// `Farming Info`
  String get farmingInfo {
    return Intl.message(
      'Farming Info',
      name: 'farmingInfo',
      desc: '',
      args: [],
    );
  }

  /// `Farming Practice`
  String get farmingPractice {
    return Intl.message(
      'Farming Practice',
      name: 'farmingPractice',
      desc: '',
      args: [],
    );
  }

  /// `Farming Practice Final Stage`
  String get farmingPracticeFinalStage {
    return Intl.message(
      'Farming Practice Final Stage',
      name: 'farmingPracticeFinalStage',
      desc: '',
      args: [],
    );
  }

  /// `Farming Summary`
  String get farmingSummary {
    return Intl.message(
      'Farming Summary',
      name: 'farmingSummary',
      desc: '',
      args: [],
    );
  }

  /// `Father's name should not be empty`
  String get fatherNameShouldNotBeEmpty {
    return Intl.message(
      'Father\'s name should not be empty',
      name: 'fatherNameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Father/Spouse Name`
  String get fatherName {
    return Intl.message(
      'Father/Spouse Name',
      name: 'fatherName',
      desc: '',
      args: [],
    );
  }

  /// `Father's Name`
  String get fathersName {
    return Intl.message(
      'Father\'s Name',
      name: 'fathersName',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Female Members`
  String get femaleMembers {
    return Intl.message(
      'Female Members',
      name: 'femaleMembers',
      desc: '',
      args: [],
    );
  }

  /// `Female field should not be empty`
  String get femaleShouldNotBeEmpty {
    return Intl.message(
      'Female field should not be empty',
      name: 'femaleShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Name`
  String get fertilizerName {
    return Intl.message(
      'Fertilizer Name',
      name: 'fertilizerName',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Suggestion`
  String get fertilizerSuggestion {
    return Intl.message(
      'Fertilizer Suggestion',
      name: 'fertilizerSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Fetching artist data`
  String get fetchingArtistData {
    return Intl.message(
      'Fetching artist data',
      name: 'fetchingArtistData',
      desc: '',
      args: [],
    );
  }

  /// `Field shouldn't be empty`
  String get fieldShouldntBeEmpty {
    return Intl.message(
      'Field shouldn\'t be empty',
      name: 'fieldShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Financial`
  String get financial {
    return Intl.message('Financial', name: 'financial', desc: '', args: []);
  }

  /// `Financial Information`
  String get financialInformation {
    return Intl.message(
      'Financial Information',
      name: 'financialInformation',
      desc: '',
      args: [],
    );
  }

  /// `Risk of flood`
  String get floodrisk {
    return Intl.message('Risk of flood', name: 'floodrisk', desc: '', args: []);
  }

  /// `Followers`
  String get followers {
    return Intl.message('Followers', name: 'followers', desc: '', args: []);
  }

  /// `How do you pass your free time?`
  String get freeTime {
    return Intl.message(
      'How do you pass your free time?',
      name: 'freeTime',
      desc: '',
      args: [],
    );
  }

  /// `From where do you get financial support for cultivation?`
  String get fromWhereDoYouGetFinancialSupportForCultivation {
    return Intl.message(
      'From where do you get financial support for cultivation?',
      name: 'fromWhereDoYouGetFinancialSupportForCultivation',
      desc: '',
      args: [],
    );
  }

  /// `Garlic`
  String get garlic {
    return Intl.message('Garlic', name: 'garlic', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Gender not selected`
  String get genderSelectedShouldNotBeEmpty {
    return Intl.message(
      'Gender not selected',
      name: 'genderSelectedShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `General Info`
  String get generalInfo {
    return Intl.message(
      'General Info',
      name: 'generalInfo',
      desc: '',
      args: [],
    );
  }

  /// `General Information for Farmer`
  String get generalInformation {
    return Intl.message(
      'General Information for Farmer',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Generate Prescription`
  String get generatePrescription {
    return Intl.message(
      'Generate Prescription',
      name: 'generatePrescription',
      desc: '',
      args: [],
    );
  }

  /// `Give the rating for this farming.`
  String get giveRatingforFarming {
    return Intl.message(
      'Give the rating for this farming.',
      name: 'giveRatingforFarming',
      desc: '',
      args: [],
    );
  }

  /// `Gossiping at the tea stall`
  String get gossipingAtStall {
    return Intl.message(
      'Gossiping at the tea stall',
      name: 'gossipingAtStall',
      desc: '',
      args: [],
    );
  }

  /// `Government Officer`
  String get governmentOfficer {
    return Intl.message(
      'Government Officer',
      name: 'governmentOfficer',
      desc: '',
      args: [],
    );
  }

  /// `Govt Banks`
  String get govtBanks {
    return Intl.message('Govt Banks', name: 'govtBanks', desc: '', args: []);
  }

  /// `Guarantee of sale/contract farming`
  String get guaranteeContractFarming {
    return Intl.message(
      'Guarantee of sale/contract farming',
      name: 'guaranteeContractFarming',
      desc: '',
      args: [],
    );
  }

  /// `Hail : `
  String get hail {
    return Intl.message('Hail : ', name: 'hail', desc: '', args: []);
  }

  /// `Harvesting Cost`
  String get harvestingCost {
    return Intl.message(
      'Harvesting Cost',
      name: 'harvestingCost',
      desc: '',
      args: [],
    );
  }

  /// `Do you have savings?`
  String get haveSavings {
    return Intl.message(
      'Do you have savings?',
      name: 'haveSavings',
      desc: '',
      args: [],
    );
  }

  /// `Help and Information`
  String get helpandInformation {
    return Intl.message(
      'Help and Information',
      name: 'helpandInformation',
      desc: '',
      args: [],
    );
  }

  /// `Helpline info`
  String get helplineinfo {
    return Intl.message(
      'Helpline info',
      name: 'helplineinfo',
      desc: '',
      args: [],
    );
  }

  /// `High School`
  String get highShcool {
    return Intl.message('High School', name: 'highShcool', desc: '', args: []);
  }

  /// `Hotline: 0197997 0 997`
  String get hotline {
    return Intl.message(
      'Hotline: 0197997 0 997',
      name: 'hotline',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message('Hours', name: 'hours', desc: '', args: []);
  }

  /// `How do you control weeds?`
  String get howDoYouControlWeeds {
    return Intl.message(
      'How do you control weeds?',
      name: 'howDoYouControlWeeds',
      desc: '',
      args: [],
    );
  }

  /// `Humidity: `
  String get humidity {
    return Intl.message('Humidity: ', name: 'humidity', desc: '', args: []);
  }

  /// `Information of Family`
  String get informationFamily {
    return Intl.message(
      'Information of Family',
      name: 'informationFamily',
      desc: '',
      args: [],
    );
  }

  /// `Input Cost`
  String get inputCost {
    return Intl.message('Input Cost', name: 'inputCost', desc: '', args: []);
  }

  /// `Input total Cost`
  String get inputHerbicideSeedFertilizerPesticideCostoPerBigha {
    return Intl.message(
      'Input total Cost',
      name: 'inputHerbicideSeedFertilizerPesticideCostoPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Input Retailer`
  String get inputRetailer {
    return Intl.message(
      'Input Retailer',
      name: 'inputRetailer',
      desc: '',
      args: [],
    );
  }

  /// `Agri Input (seed, fertilizer, pesticide)`
  String get inputSeedFertilizerPesticide {
    return Intl.message(
      'Agri Input (seed, fertilizer, pesticide)',
      name: 'inputSeedFertilizerPesticide',
      desc: '',
      args: [],
    );
  }

  /// `Institutional (bank/ngo)`
  String get institutionalBankOrNGO {
    return Intl.message(
      'Institutional (bank/ngo)',
      name: 'institutionalBankOrNGO',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Login Credential`
  String get invalidLoginCredential {
    return Intl.message(
      'Invalid Login Credential',
      name: 'invalidLoginCredential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Role`
  String get invalidRole {
    return Intl.message(
      'Invalid Role',
      name: 'invalidRole',
      desc: '',
      args: [],
    );
  }

  /// `Irrigation Cost`
  String get irrigationCost {
    return Intl.message(
      'Irrigation Cost',
      name: 'irrigationCost',
      desc: '',
      args: [],
    );
  }

  /// `Irrigation Cost per bigha`
  String get irrigationCostperbigha {
    return Intl.message(
      'Irrigation Cost per bigha',
      name: 'irrigationCostperbigha',
      desc: '',
      args: [],
    );
  }

  /// `Irrigation`
  String get irrigation {
    return Intl.message('Irrigation', name: 'irrigation', desc: '', args: []);
  }

  /// `Item`
  String get item {
    return Intl.message('Item', name: 'item', desc: '', args: []);
  }

  /// `Joint`
  String get join {
    return Intl.message('Joint', name: 'join', desc: '', args: []);
  }

  /// `Jute`
  String get jute {
    return Intl.message('Jute', name: 'jute', desc: '', args: []);
  }

  /// `kg/Bigha`
  String get kgPerBigha {
    return Intl.message('kg/Bigha', name: 'kgPerBigha', desc: '', args: []);
  }

  /// `kg/Decimal`
  String get kgPerDecimal {
    return Intl.message('kg/Decimal', name: 'kgPerDecimal', desc: '', args: []);
  }

  /// `Kg/Ha`
  String get kgperHa {
    return Intl.message('Kg/Ha', name: 'kgperHa', desc: '', args: []);
  }

  /// `Kharip 01`
  String get kharip1 {
    return Intl.message('Kharip 01', name: 'kharip1', desc: '', args: []);
  }

  /// `16 March(Chaitra) - 30 June(Aashar)`
  String get kharip1Duration {
    return Intl.message(
      '16 March(Chaitra) - 30 June(Aashar)',
      name: 'kharip1Duration',
      desc: '',
      args: [],
    );
  }

  /// `Kharip 02`
  String get kharip2 {
    return Intl.message('Kharip 02', name: 'kharip2', desc: '', args: []);
  }

  /// `1 July(Aashar) - 15 October(Ashwin)`
  String get kharip2Duration {
    return Intl.message(
      '1 July(Aashar) - 15 October(Ashwin)',
      name: 'kharip2Duration',
      desc: '',
      args: [],
    );
  }

  /// `Do you know any farmer helpline numbers?`
  String get knowFarmerHelplineNumbers {
    return Intl.message(
      'Do you know any farmer helpline numbers?',
      name: 'knowFarmerHelplineNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Labor Cost for land preparation per bigha`
  String get laborCostForLandPreparationPerBigha {
    return Intl.message(
      'Labor Cost for land preparation per bigha',
      name: 'laborCostForLandPreparationPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Labor Cost for weed per bigha`
  String get laborCostForWeedPerBigha {
    return Intl.message(
      'Labor Cost for weed per bigha',
      name: 'laborCostForWeedPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Labor Cost for harvesting per bigha`
  String get laborCostHarvestingPerBigha {
    return Intl.message(
      'Labor Cost for harvesting per bigha',
      name: 'laborCostHarvestingPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Labor`
  String get labor {
    return Intl.message('Labor', name: 'labor', desc: '', args: []);
  }

  /// `Land area field shouldn't be empty`
  String get landAreaFieldShouldnTBeEmpty {
    return Intl.message(
      'Land area field shouldn\'t be empty',
      name: 'landAreaFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Land for cultivation(Shotok)`
  String get landCultivated {
    return Intl.message(
      'Land for cultivation(Shotok)',
      name: 'landCultivated',
      desc: '',
      args: [],
    );
  }

  /// `Land Preparation Cost`
  String get landPreparationCost {
    return Intl.message(
      'Land Preparation Cost',
      name: 'landPreparationCost',
      desc: '',
      args: [],
    );
  }

  /// `Lentil`
  String get lentil {
    return Intl.message('Lentil', name: 'lentil', desc: '', args: []);
  }

  /// `Less than elementary level (Illiterate)`
  String get lessThanElementaryLevel {
    return Intl.message(
      'Less than elementary level (Illiterate)',
      name: 'lessThanElementaryLevel',
      desc: '',
      args: [],
    );
  }

  /// `Level of Education`
  String get levelEducation {
    return Intl.message(
      'Level of Education',
      name: 'levelEducation',
      desc: '',
      args: [],
    );
  }

  /// `Level Of Education not selected`
  String get levelOfeducationShouldNotBeEmpty {
    return Intl.message(
      'Level Of Education not selected',
      name: 'levelOfeducationShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Listening Radio`
  String get listeningRadio {
    return Intl.message(
      'Listening Radio',
      name: 'listeningRadio',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Local NGO`
  String get localNGO {
    return Intl.message('Local NGO', name: 'localNGO', desc: '', args: []);
  }

  /// `Local wholesale/farmer market.`
  String get localWholesaleFarmerMarket {
    return Intl.message(
      'Local wholesale/farmer market.',
      name: 'localWholesaleFarmerMarket',
      desc: '',
      args: [],
    );
  }

  /// `Login Successfully`
  String get loginSuccess {
    return Intl.message(
      'Login Successfully',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Low-Cost Capital`
  String get lowCost15to18interest {
    return Intl.message(
      'Low-Cost Capital',
      name: 'lowCost15to18interest',
      desc: '',
      args: [],
    );
  }

  /// `Low-cost Capital`
  String get lowCostCapital {
    return Intl.message(
      'Low-cost Capital',
      name: 'lowCostCapital',
      desc: '',
      args: [],
    );
  }

  /// `Machine Service Cost`
  String get machineServiceCost {
    return Intl.message(
      'Machine Service Cost',
      name: 'machineServiceCost',
      desc: '',
      args: [],
    );
  }

  /// `Machine Services (land preparation, harvester, transplanter, Irrigation) `
  String get machineService {
    return Intl.message(
      'Machine Services (land preparation, harvester, transplanter, Irrigation) ',
      name: 'machineService',
      desc: '',
      args: [],
    );
  }

  /// `Machine service (if any) per bigha`
  String get machineServicePerBigha {
    return Intl.message(
      'Machine service (if any) per bigha',
      name: 'machineServicePerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Machine Services (land preparation, tractor, harvester)`
  String get machineServices {
    return Intl.message(
      'Machine Services (land preparation, tractor, harvester)',
      name: 'machineServices',
      desc: '',
      args: [],
    );
  }

  /// `Maize`
  String get maize {
    return Intl.message('Maize', name: 'maize', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Male Members`
  String get maleMembers {
    return Intl.message(
      'Male Members',
      name: 'maleMembers',
      desc: '',
      args: [],
    );
  }

  /// `Male field shouldn't be empty`
  String get maleShouldNotBeEmpty {
    return Intl.message(
      'Male field shouldn\'t be empty',
      name: 'maleShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Manual weeding by labor`
  String get manualWeedingByLabor {
    return Intl.message(
      'Manual weeding by labor',
      name: 'manualWeedingByLabor',
      desc: '',
      args: [],
    );
  }

  /// `Major Problems`
  String get majorProblems {
    return Intl.message(
      'Major Problems',
      name: 'majorProblems',
      desc: '',
      args: [],
    );
  }

  /// `Mention the problems you face at the time of cultivation?`
  String get mentionProblemsCultivation {
    return Intl.message(
      'Mention the problems you face at the time of cultivation?',
      name: 'mentionProblemsCultivation',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number shouldn't be empty`
  String get mobileNumberShouldNotBeEmpty {
    return Intl.message(
      'Mobile number shouldn\'t be empty',
      name: 'mobileNumberShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Name shouldn't be empty`
  String get nameShouldNotBeEmpty {
    return Intl.message(
      'Name shouldn\'t be empty',
      name: 'nameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `NGO/Input Sales Officer`
  String get nGOSalesOfficer {
    return Intl.message(
      'NGO/Input Sales Officer',
      name: 'nGOSalesOfficer',
      desc: '',
      args: [],
    );
  }

  /// `NID`
  String get nID {
    return Intl.message('NID', name: 'nID', desc: '', args: []);
  }

  /// `NID No`
  String get nIdNo {
    return Intl.message('NID No', name: 'nIdNo', desc: '', args: []);
  }

  /// `NID format is invalid`
  String get nidShouldNotBeEmpty {
    return Intl.message(
      'NID format is invalid',
      name: 'nidShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Average amount`
  String get average_test_data {
    return Intl.message(
      'Average amount',
      name: 'average_test_data',
      desc: '',
      args: [],
    );
  }

  /// `Nitrogen`
  String get nitrogen {
    return Intl.message('Nitrogen', name: 'nitrogen', desc: '', args: []);
  }

  /// `Probable range 0 - 3600`
  String get nitrogen_range {
    return Intl.message(
      'Probable range 0 - 3600',
      name: 'nitrogen_range',
      desc: '',
      args: [],
    );
  }

  /// `Nitrogen shouldn't be empty`
  String get nitrogenShouldntBeEmpty {
    return Intl.message(
      'Nitrogen shouldn\'t be empty',
      name: 'nitrogenShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message('No Data', name: 'noData', desc: '', args: []);
  }

  /// `No date Picked!`
  String get noDatePicked {
    return Intl.message(
      'No date Picked!',
      name: 'noDatePicked',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message('None', name: 'none', desc: '', args: []);
  }

  /// `Non-institutional (family member/local people)`
  String get noninstitutionalFamilyMemberOrLocalPeople {
    return Intl.message(
      'Non-institutional (family member/local people)',
      name: 'noninstitutionalFamilyMemberOrLocalPeople',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Not Selected`
  String get notSelectedDropDown {
    return Intl.message(
      'Not Selected',
      name: 'notSelectedDropDown',
      desc: '',
      args: [],
    );
  }

  /// `Please select`
  String get pleaseSelect {
    return Intl.message(
      'Please select',
      name: 'pleaseSelect',
      desc: '',
      args: [],
    );
  }

  /// `Onion`
  String get onion {
    return Intl.message('Onion', name: 'onion', desc: '', args: []);
  }

  /// `Online Place/other`
  String get onlinePlaceorOther {
    return Intl.message(
      'Online Place/other',
      name: 'onlinePlaceorOther',
      desc: '',
      args: [],
    );
  }

  /// `Other Cost`
  String get otherCost {
    return Intl.message('Other Cost', name: 'otherCost', desc: '', args: []);
  }

  /// `Other cost per bigha`
  String get otherCostPerBigha {
    return Intl.message(
      'Other cost per bigha',
      name: 'otherCostPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Other income field shouldn't be empty`
  String get otherIncomeFieldShouldnTBeEmpty {
    return Intl.message(
      'Other income field shouldn\'t be empty',
      name: 'otherIncomeFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Other Information for Farmer`
  String get otherInformation {
    return Intl.message(
      'Other Information for Farmer',
      name: 'otherInformation',
      desc: '',
      args: [],
    );
  }

  /// `Do you have other occupations?`
  String get otherOccupations {
    return Intl.message(
      'Do you have other occupations?',
      name: 'otherOccupations',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Others`
  String get others {
    return Intl.message('Others', name: 'others', desc: '', args: []);
  }

  /// `Others Problem`
  String get othersProblem {
    return Intl.message(
      'Others Problem',
      name: 'othersProblem',
      desc: '',
      args: [],
    );
  }

  /// `1`
  String get page1 {
    return Intl.message('1', name: 'page1', desc: '', args: []);
  }

  /// `2`
  String get page2 {
    return Intl.message('2', name: 'page2', desc: '', args: []);
  }

  /// `3`
  String get page3 {
    return Intl.message('3', name: 'page3', desc: '', args: []);
  }

  /// `4`
  String get page4 {
    return Intl.message('4', name: 'page4', desc: '', args: []);
  }

  /// `5`
  String get page5 {
    return Intl.message('5', name: 'page5', desc: '', args: []);
  }

  /// `6`
  String get page6 {
    return Intl.message('6', name: 'page6', desc: '', args: []);
  }

  /// `/6`
  String get page6of {
    return Intl.message('/6', name: 'page6of', desc: '', args: []);
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message('Personal', name: 'personal', desc: '', args: []);
  }

  /// `Unit Cost`
  String get perUnitCost {
    return Intl.message('Unit Cost', name: 'perUnitCost', desc: '', args: []);
  }

  /// `Pesticide/Herbicide/Weedicide Suggestion`
  String get pesticideSuggestion {
    return Intl.message(
      'Pesticide/Herbicide/Weedicide Suggestion',
      name: 'pesticideSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Phone type isn't selected`
  String get phoneTypeIsnTSelected {
    return Intl.message(
      'Phone type isn\'t selected',
      name: 'phoneTypeIsnTSelected',
      desc: '',
      args: [],
    );
  }

  /// `Phosphorus`
  String get phosphorus {
    return Intl.message('Phosphorus', name: 'phosphorus', desc: '', args: []);
  }

  /// `Probable range 0 - 24.5`
  String get phosphorus_range {
    return Intl.message(
      'Probable range 0 - 24.5',
      name: 'phosphorus_range',
      desc: '',
      args: [],
    );
  }

  /// `Phosphorus shouldn't be empty`
  String get phosphorusShouldntBeEmpty {
    return Intl.message(
      'Phosphorus shouldn\'t be empty',
      name: 'phosphorusShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `pH`
  String get pH {
    return Intl.message('pH', name: 'pH', desc: '', args: []);
  }

  /// `Probable range 0 - 14`
  String get pH_range {
    return Intl.message(
      'Probable range 0 - 14',
      name: 'pH_range',
      desc: '',
      args: [],
    );
  }

  /// `pH shouldn't be empty`
  String get pHShouldntBeEmpty {
    return Intl.message(
      'pH shouldn\'t be empty',
      name: 'pHShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all the required values.`
  String get pleaseEnterAllTheRequiredValues {
    return Intl.message(
      'Please enter all the required values.',
      name: 'pleaseEnterAllTheRequiredValues',
      desc: '',
      args: [],
    );
  }

  /// `Please select an unit!`
  String get pleaseSelectAnUnit {
    return Intl.message(
      'Please select an unit!',
      name: 'pleaseSelectAnUnit',
      desc: '',
      args: [],
    );
  }

  /// `Potassium`
  String get potassium {
    return Intl.message('Potassium', name: 'potassium', desc: '', args: []);
  }

  /// `Probable range 0 - 120`
  String get potassium_range {
    return Intl.message(
      'Probable range 0 - 120',
      name: 'potassium_range',
      desc: '',
      args: [],
    );
  }

  /// `Potassium shouldn't be empty`
  String get potassiumShouldntBeEmpty {
    return Intl.message(
      'Potassium shouldn\'t be empty',
      name: 'potassiumShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Potato`
  String get potato {
    return Intl.message('Potato', name: 'potato', desc: '', args: []);
  }

  /// `Prefer not to say`
  String get preferNotToSay {
    return Intl.message(
      'Prefer not to say',
      name: 'preferNotToSay',
      desc: '',
      args: [],
    );
  }

  /// `Aunkur Agricultural Prescription`
  String get prescriptionTitle {
    return Intl.message(
      'Aunkur Agricultural Prescription',
      name: 'prescriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price Unit`
  String get priceUnit {
    return Intl.message('Price Unit', name: 'priceUnit', desc: '', args: []);
  }

  /// `Primary Crops`
  String get primaryCrops {
    return Intl.message(
      'Primary Crops',
      name: 'primaryCrops',
      desc: '',
      args: [],
    );
  }

  /// `Private / Co-operative Banks`
  String get privateOrCooperativeBanks {
    return Intl.message(
      'Private / Co-operative Banks',
      name: 'privateOrCooperativeBanks',
      desc: '',
      args: [],
    );
  }

  /// `Mohajon / Local People`
  String get mohajonLocalPeople {
    return Intl.message(
      'Mohajon / Local People',
      name: 'mohajonLocalPeople',
      desc: '',
      args: [],
    );
  }

  /// `Father/Spouse Name`
  String get fatherOrSpouseName {
    return Intl.message(
      'Father/Spouse Name',
      name: 'fatherOrSpouseName',
      desc: '',
      args: [],
    );
  }

  /// `Probable Cause`
  String get probableCause {
    return Intl.message(
      'Probable Cause',
      name: 'probableCause',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth​`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth​',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Income/Month`
  String get incomePerMonth {
    return Intl.message(
      'Income/Month',
      name: 'incomePerMonth',
      desc: '',
      args: [],
    );
  }

  /// `Problem`
  String get problem {
    return Intl.message('Problem', name: 'problem', desc: '', args: []);
  }

  /// `Problems`
  String get problems {
    return Intl.message('Problems', name: 'problems', desc: '', args: []);
  }

  /// `Mention the problems you face at the time of cultivation?`
  String get problemsCultivation {
    return Intl.message(
      'Mention the problems you face at the time of cultivation?',
      name: 'problemsCultivation',
      desc: '',
      args: [],
    );
  }

  /// `Production Cost`
  String get productionCost {
    return Intl.message(
      'Production Cost',
      name: 'productionCost',
      desc: '',
      args: [],
    );
  }

  /// `Production Unit`
  String get productionUnit {
    return Intl.message(
      'Production Unit',
      name: 'productionUnit',
      desc: '',
      args: [],
    );
  }

  /// `a product of`
  String get productOf {
    return Intl.message('a product of', name: 'productOf', desc: '', args: []);
  }

  /// `Profile Details`
  String get profileDetails {
    return Intl.message(
      'Profile Details',
      name: 'profileDetails',
      desc: '',
      args: [],
    );
  }

  /// `Profit Per Kg`
  String get profitPerKg {
    return Intl.message(
      'Profit Per Kg',
      name: 'profitPerKg',
      desc: '',
      args: [],
    );
  }

  /// `Profit Per Shotok`
  String get profitPerShotok {
    return Intl.message(
      'Profit Per Shotok',
      name: 'profitPerShotok',
      desc: '',
      args: [],
    );
  }

  /// `Proj. Yield`
  String get projectedYield {
    return Intl.message(
      'Proj. Yield',
      name: 'projectedYield',
      desc: '',
      args: [],
    );
  }

  /// `Purchase From Market`
  String get purchaseFromMarket {
    return Intl.message(
      'Purchase From Market',
      name: 'purchaseFromMarket',
      desc: '',
      args: [],
    );
  }

  /// `RainIn : `
  String get rainIn {
    return Intl.message('RainIn : ', name: 'rainIn', desc: '', args: []);
  }

  /// `Ranking`
  String get ranking {
    return Intl.message('Ranking', name: 'ranking', desc: '', args: []);
  }

  /// `Ratings`
  String get ratings {
    return Intl.message('Ratings', name: 'ratings', desc: '', args: []);
  }

  /// `Reading newspaper`
  String get readingNewspaper {
    return Intl.message(
      'Reading newspaper',
      name: 'readingNewspaper',
      desc: '',
      args: [],
    );
  }

  /// `Registered`
  String get registered {
    return Intl.message('Registered', name: 'registered', desc: '', args: []);
  }

  /// `Retake`
  String get retake {
    return Intl.message('Retake', name: 'retake', desc: '', args: []);
  }

  /// `Rice`
  String get rice {
    return Intl.message('Rice', name: 'rice', desc: '', args: []);
  }

  /// `Robi`
  String get robiSeason {
    return Intl.message('Robi', name: 'robiSeason', desc: '', args: []);
  }

  /// `16 October(Kartika)-15 March(Falgun)`
  String get robiSeasonDuration {
    return Intl.message(
      '16 October(Kartika)-15 March(Falgun)',
      name: 'robiSeasonDuration',
      desc: '',
      args: [],
    );
  }

  /// `Salary per month`
  String get salaryPerMonth {
    return Intl.message(
      'Salary per month',
      name: 'salaryPerMonth',
      desc: '',
      args: [],
    );
  }

  /// `Save and Next`
  String get saveAndNext {
    return Intl.message(
      'Save and Next',
      name: 'saveAndNext',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `School going member shouldn't be greater than total member`
  String get schoolGoingMemberGreater {
    return Intl.message(
      'School going member shouldn\'t be greater than total member',
      name: 'schoolGoingMemberGreater',
      desc: '',
      args: [],
    );
  }

  /// `School Going`
  String get schoolGoing {
    return Intl.message(
      'School Going',
      name: 'schoolGoing',
      desc: '',
      args: [],
    );
  }

  /// `School going field shouldn't be empty`
  String get schoolGoingShouldNotBeEmpty {
    return Intl.message(
      'School going field shouldn\'t be empty',
      name: 'schoolGoingShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Search here`
  String get searchHere {
    return Intl.message('Search here', name: 'searchHere', desc: '', args: []);
  }

  /// `Season field shouldn't be empty`
  String get seasonFieldShouldnTBeEmpty {
    return Intl.message(
      'Season field shouldn\'t be empty',
      name: 'seasonFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Season `
  String get season {
    return Intl.message('Season ', name: 'season', desc: '', args: []);
  }

  /// `Seed collectioin field shouldn't be empty`
  String get seedCollectioinFieldShouldnTBeEmpty {
    return Intl.message(
      'Seed collectioin field shouldn\'t be empty',
      name: 'seedCollectioinFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Seed Collection`
  String get seedCollection {
    return Intl.message(
      'Seed Collection',
      name: 'seedCollection',
      desc: '',
      args: [],
    );
  }

  /// `Seed Suggestion`
  String get seedSuggestion {
    return Intl.message(
      'Seed Suggestion',
      name: 'seedSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Select Crop`
  String get selectCrop {
    return Intl.message('Select Crop', name: 'selectCrop', desc: '', args: []);
  }

  /// `Select Crops`
  String get selectCrops {
    return Intl.message(
      'Select Crops',
      name: 'selectCrops',
      desc: '',
      args: [],
    );
  }

  /// `Selected Crop: `
  String get selectedCrop {
    return Intl.message(
      'Selected Crop: ',
      name: 'selectedCrop',
      desc: '',
      args: [],
    );
  }

  /// `Select Season`
  String get selectSeason {
    return Intl.message(
      'Select Season',
      name: 'selectSeason',
      desc: '',
      args: [],
    );
  }

  /// `Select year`
  String get selectYear {
    return Intl.message('Select year', name: 'selectYear', desc: '', args: []);
  }

  /// `Self-finance`
  String get selfFinance {
    return Intl.message(
      'Self-finance',
      name: 'selfFinance',
      desc: '',
      args: [],
    );
  }

  /// `Self Production`
  String get selfProduction {
    return Intl.message(
      'Self Production',
      name: 'selfProduction',
      desc: '',
      args: [],
    );
  }

  /// `Selling price of your cultivated crops`
  String get sellingPriceofYourCultivatedCrops {
    return Intl.message(
      'Selling price of your cultivated crops',
      name: 'sellingPriceofYourCultivatedCrops',
      desc: '',
      args: [],
    );
  }

  /// `Selling price`
  String get sellingPrice {
    return Intl.message(
      'Selling price',
      name: 'sellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Sell Product:`
  String get sellProduct {
    return Intl.message(
      'Sell Product:',
      name: 'sellProduct',
      desc: '',
      args: [],
    );
  }

  /// `Senior/Other Farmer`
  String get seniorFarmer {
    return Intl.message(
      'Senior/Other Farmer',
      name: 'seniorFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Service salary field shouldn't be empty`
  String get serviceSalaryFieldShouldnTBeEmpty {
    return Intl.message(
      'Service salary field shouldn\'t be empty',
      name: 'serviceSalaryFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `SFID`
  String get sfid {
    return Intl.message('SFID', name: 'sfid', desc: '', args: []);
  }

  /// `SFID list`
  String get sfidList {
    return Intl.message('SFID list', name: 'sfidList', desc: '', args: []);
  }

  /// `Select wish`
  String get selectWish {
    return Intl.message('Select wish', name: 'selectWish', desc: '', args: []);
  }

  /// `Decimal`
  String get shotok {
    return Intl.message('Decimal', name: 'shotok', desc: '', args: []);
  }

  /// `Single`
  String get single {
    return Intl.message('Single', name: 'single', desc: '', args: []);
  }

  /// `Smartphone`
  String get smartphone {
    return Intl.message('Smartphone', name: 'smartphone', desc: '', args: []);
  }

  /// `Soil test center name`
  String get soilInfo {
    return Intl.message(
      'Soil test center name',
      name: 'soilInfo',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test, Prescription & Training`
  String get soilPrescription {
    return Intl.message(
      'Soil Test, Prescription & Training',
      name: 'soilPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test History`
  String get soilTestHistory {
    return Intl.message(
      'Soil Test History',
      name: 'soilTestHistory',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test Info`
  String get soiltestInfo {
    return Intl.message(
      'Soil Test Info',
      name: 'soiltestInfo',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test`
  String get soilTest {
    return Intl.message('Soil Test', name: 'soilTest', desc: '', args: []);
  }

  /// `Soil test, weather info, training`
  String get soilTWITraining {
    return Intl.message(
      'Soil test, weather info, training',
      name: 'soilTWITraining',
      desc: '',
      args: [],
    );
  }

  /// `SolarAir : `
  String get solarAir {
    return Intl.message('SolarAir : ', name: 'solarAir', desc: '', args: []);
  }

  /// `Storage Facility`
  String get storageFacility {
    return Intl.message(
      'Storage Facility',
      name: 'storageFacility',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Sugercane`
  String get sugercane {
    return Intl.message('Sugercane', name: 'sugercane', desc: '', args: []);
  }

  /// `Sulfur shouldn't be empty`
  String get sulfurShouldntBeEmpty {
    return Intl.message(
      'Sulfur shouldn\'t be empty',
      name: 'sulfurShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Sulfur`
  String get sulfur {
    return Intl.message('Sulfur', name: 'sulfur', desc: '', args: []);
  }

  /// `Symptom`
  String get symptom {
    return Intl.message('Symptom', name: 'symptom', desc: '', args: []);
  }

  /// `Temperature : `
  String get temperature {
    return Intl.message(
      'Temperature : ',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Do you test soil?`
  String get testSoilBeforeAfter {
    return Intl.message(
      'Do you test soil?',
      name: 'testSoilBeforeAfter',
      desc: '',
      args: [],
    );
  }

  /// `Add New Test`
  String get testSoil {
    return Intl.message('Add New Test', name: 'testSoil', desc: '', args: []);
  }

  /// `Third gender`
  String get thirdGender {
    return Intl.message(
      'Third gender',
      name: 'thirdGender',
      desc: '',
      args: [],
    );
  }

  /// `How much time do you spend on this? (Hours)`
  String get timeSpendOnFreeTime {
    return Intl.message(
      'How much time do you spend on this? (Hours)',
      name: 'timeSpendOnFreeTime',
      desc: '',
      args: [],
    );
  }

  /// `Time spent on these shouldn't be empty`
  String get timeSpentOnTheseShouldnTBeEmpty {
    return Intl.message(
      'Time spent on these shouldn\'t be empty',
      name: 'timeSpentOnTheseShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `TK/Bigha`
  String get tkPerBigha {
    return Intl.message('TK/Bigha', name: 'tkPerBigha', desc: '', args: []);
  }

  /// `Tk/Kg`
  String get tkPerKg {
    return Intl.message('Tk/Kg', name: 'tkPerKg', desc: '', args: []);
  }

  /// `Tk/month`
  String get tkPerMonth {
    return Intl.message('Tk/month', name: 'tkPerMonth', desc: '', args: []);
  }

  /// `Tk/Shotok`
  String get tkPerShotok {
    return Intl.message('Tk/Shotok', name: 'tkPerShotok', desc: '', args: []);
  }

  /// `Tk`
  String get tk {
    return Intl.message('Tk', name: 'tk', desc: '', args: []);
  }

  /// `Please enter the password`
  String get toastEnterPassword {
    return Intl.message(
      'Please enter the password',
      name: 'toastEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// ` Cultivation Area`
  String get totalareaoffarming {
    return Intl.message(
      ' Cultivation Area',
      name: 'totalareaoffarming',
      desc: '',
      args: [],
    );
  }

  /// `Total area of land (Decimal)`
  String get totalAreaOfLand {
    return Intl.message(
      'Total area of land (Decimal)',
      name: 'totalAreaOfLand',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost per Bigha`
  String get totalCostPerBigha {
    return Intl.message(
      'Total Cost per Bigha',
      name: 'totalCostPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost`
  String get totalCost {
    return Intl.message('Total Cost', name: 'totalCost', desc: '', args: []);
  }

  /// `Total land area field shouldn't be empty`
  String get totalLandAreaFieldShouldnTBeEmpty {
    return Intl.message(
      'Total land area field shouldn\'t be empty',
      name: 'totalLandAreaFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Total land area (Decimal)`
  String get totalLandArea {
    return Intl.message(
      'Total land area (Decimal)',
      name: 'totalLandArea',
      desc: '',
      args: [],
    );
  }

  /// `Total Members`
  String get totalMembers {
    return Intl.message(
      'Total Members',
      name: 'totalMembers',
      desc: '',
      args: [],
    );
  }

  /// `Total Production(Mound per Bigha)`
  String get totalProductionMoundPerBigha {
    return Intl.message(
      'Total Production(Mound per Bigha)',
      name: 'totalProductionMoundPerBigha',
      desc: '',
      args: [],
    );
  }

  /// `Total production`
  String get totalproduction {
    return Intl.message(
      'Total production',
      name: 'totalproduction',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit`
  String get totalProfit {
    return Intl.message(
      'Total Profit',
      name: 'totalProfit',
      desc: '',
      args: [],
    );
  }

  /// `Total `
  String get total {
    return Intl.message('Total ', name: 'total', desc: '', args: []);
  }

  /// `Trade Name`
  String get tradeName {
    return Intl.message('Trade Name', name: 'tradeName', desc: '', args: []);
  }

  /// `How do you get training and information now?`
  String get trainingInformationNow {
    return Intl.message(
      'How do you get training and information now?',
      name: 'trainingInformationNow',
      desc: '',
      args: [],
    );
  }

  /// `Transportation`
  String get transportation {
    return Intl.message(
      'Transportation',
      name: 'transportation',
      desc: '',
      args: [],
    );
  }

  /// `Turmeric`
  String get turmeric {
    return Intl.message('Turmeric', name: 'turmeric', desc: '', args: []);
  }

  /// `Two year college`
  String get twoYearsCollege {
    return Intl.message(
      'Two year college',
      name: 'twoYearsCollege',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Unavailability of genuine inputs (seed, fertilizer, pesticide)`
  String get unavailabilityGenuineInputs {
    return Intl.message(
      'Unavailability of genuine inputs (seed, fertilizer, pesticide)',
      name: 'unavailabilityGenuineInputs',
      desc: '',
      args: [],
    );
  }

  /// `union not selected`
  String get unionShouldNotBeEmpty {
    return Intl.message(
      'union not selected',
      name: 'unionShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Union`
  String get union {
    return Intl.message('Union', name: 'union', desc: '', args: []);
  }

  /// `Unit`
  String get unit {
    return Intl.message('Unit', name: 'unit', desc: '', args: []);
  }

  /// `University or above`
  String get universityOrAbove {
    return Intl.message(
      'University or above',
      name: 'universityOrAbove',
      desc: '',
      args: [],
    );
  }

  /// `Upazila not selected`
  String get upazilaShouldNotBeEmpty {
    return Intl.message(
      'Upazila not selected',
      name: 'upazilaShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Upazila`
  String get upazila {
    return Intl.message('Upazila', name: 'upazila', desc: '', args: []);
  }

  /// `Update`
  String get updateData {
    return Intl.message('Update', name: 'updateData', desc: '', args: []);
  }

  /// `Update General Information`
  String get updateGeneralInfl {
    return Intl.message(
      'Update General Information',
      name: 'updateGeneralInfl',
      desc: '',
      args: [],
    );
  }

  /// `Update Digital literacy`
  String get updateDigitalLiteracy {
    return Intl.message(
      'Update Digital literacy',
      name: 'updateDigitalLiteracy',
      desc: '',
      args: [],
    );
  }

  /// `Update Financial Info`
  String get updateFinancialInfo {
    return Intl.message(
      'Update Financial Info',
      name: 'updateFinancialInfo',
      desc: '',
      args: [],
    );
  }

  /// `Update info of`
  String get updateInfoOf {
    return Intl.message(
      'Update info of',
      name: 'updateInfoOf',
      desc: '',
      args: [],
    );
  }

  /// `Update Problems`
  String get updateProblems {
    return Intl.message(
      'Update Problems',
      name: 'updateProblems',
      desc: '',
      args: [],
    );
  }

  /// `User doesn't exist`
  String get userDoesnTExist {
    return Intl.message(
      'User doesn\'t exist',
      name: 'userDoesnTExist',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Using social media`
  String get usingSocialMedia {
    return Intl.message(
      'Using social media',
      name: 'usingSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Variety not Selected`
  String get varietyNotSelected {
    return Intl.message(
      'Variety not Selected',
      name: 'varietyNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `Variety of crops form field shouldn't be empty`
  String get varietyOfCropsFormFieldShouldnTBeEmpty {
    return Intl.message(
      'Variety of crops form field shouldn\'t be empty',
      name: 'varietyOfCropsFormFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Variety of selected crops`
  String get varietySelectedcrops {
    return Intl.message(
      'Variety of selected crops',
      name: 'varietySelectedcrops',
      desc: '',
      args: [],
    );
  }

  /// `Variety`
  String get variety {
    return Intl.message('Variety', name: 'variety', desc: '', args: []);
  }

  /// `Village field should not be empty`
  String get villageShouldNotBeEmpty {
    return Intl.message(
      'Village field should not be empty',
      name: 'villageShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Village`
  String get village {
    return Intl.message('Village', name: 'village', desc: '', args: []);
  }

  /// `Password must be greater than 6 digits`
  String get warnPassGreater6 {
    return Intl.message(
      'Password must be greater than 6 digits',
      name: 'warnPassGreater6',
      desc: '',
      args: [],
    );
  }

  /// `Watching TV`
  String get watchingTv {
    return Intl.message('Watching TV', name: 'watchingTv', desc: '', args: []);
  }

  /// `Water Level : `
  String get waterLevel {
    return Intl.message(
      'Water Level : ',
      name: 'waterLevel',
      desc: '',
      args: [],
    );
  }

  /// `Weather Details`
  String get weatherDetails {
    return Intl.message(
      'Weather Details',
      name: 'weatherDetails',
      desc: '',
      args: [],
    );
  }

  /// `Do you get weather information?`
  String get weatherInfoAlert {
    return Intl.message(
      'Do you get weather information?',
      name: 'weatherInfoAlert',
      desc: '',
      args: [],
    );
  }

  /// `Do you get weather information/disease/infestation alert?`
  String get weatherInformationDiseaseAlert {
    return Intl.message(
      'Do you get weather information/disease/infestation alert?',
      name: 'weatherInformationDiseaseAlert',
      desc: '',
      args: [],
    );
  }

  /// `Do you get weather information/\ndisease/infestation alert?\n`
  String get weatherInformationDiseaseAlertLess {
    return Intl.message(
      'Do you get weather information/\ndisease/infestation alert?\n',
      name: 'weatherInformationDiseaseAlertLess',
      desc: '',
      args: [],
    );
  }

  /// `Weather Info`
  String get weatherInfo {
    return Intl.message(
      'Weather Info',
      name: 'weatherInfo',
      desc: '',
      args: [],
    );
  }

  /// `Weather List`
  String get weatherList {
    return Intl.message(
      'Weather List',
      name: 'weatherList',
      desc: '',
      args: [],
    );
  }

  /// `Weed Removal Cost`
  String get weedRemovalCost {
    return Intl.message(
      'Weed Removal Cost',
      name: 'weedRemovalCost',
      desc: '',
      args: [],
    );
  }

  /// `Weeds:`
  String get weeds {
    return Intl.message('Weeds:', name: 'weeds', desc: '', args: []);
  }

  /// `What type of mobile phone do you use?`
  String get whatMobilePhone {
    return Intl.message(
      'What type of mobile phone do you use?',
      name: 'whatMobilePhone',
      desc: '',
      args: [],
    );
  }

  /// `Wheat`
  String get wheat {
    return Intl.message('Wheat', name: 'wheat', desc: '', args: []);
  }

  /// `Where do you collect your seeds?`
  String get whereDoYouCollectYourSeeds {
    return Intl.message(
      'Where do you collect your seeds?',
      name: 'whereDoYouCollectYourSeeds',
      desc: '',
      args: [],
    );
  }

  /// `Location of receiving weather information.`
  String get whereDoYouGetIt {
    return Intl.message(
      'Location of receiving weather information.',
      name: 'whereDoYouGetIt',
      desc: '',
      args: [],
    );
  }

  /// `Where do you test it?`
  String get wheretestsoil {
    return Intl.message(
      'Where do you test it?',
      name: 'wheretestsoil',
      desc: '',
      args: [],
    );
  }

  /// `Where do you test it?`
  String get whereTestSoil {
    return Intl.message(
      'Where do you test it?',
      name: 'whereTestSoil',
      desc: '',
      args: [],
    );
  }

  /// `Where do you get it?`
  String get whereWeatherInfo {
    return Intl.message(
      'Where do you get it?',
      name: 'whereWeatherInfo',
      desc: '',
      args: [],
    );
  }

  /// `Where are you saving?`
  String get where {
    return Intl.message(
      'Where are you saving?',
      name: 'where',
      desc: '',
      args: [],
    );
  }

  /// `Where do you sell your product?`
  String get whereYouSellProduct {
    return Intl.message(
      'Where do you sell your product?',
      name: 'whereYouSellProduct',
      desc: '',
      args: [],
    );
  }

  /// `Wholesale from field to the middleman.`
  String get wholesaleFromFieldMiddleman {
    return Intl.message(
      'Wholesale from field to the middleman.',
      name: 'wholesaleFromFieldMiddleman',
      desc: '',
      args: [],
    );
  }

  /// `Wind Direction : `
  String get windDirection {
    return Intl.message(
      'Wind Direction : ',
      name: 'windDirection',
      desc: '',
      args: [],
    );
  }

  /// `Wind Speed : `
  String get windSpeed {
    return Intl.message('Wind Speed : ', name: 'windSpeed', desc: '', args: []);
  }

  /// `Wrong password or username`
  String get wrongUserNamePass {
    return Intl.message(
      'Wrong password or username',
      name: 'wrongUserNamePass',
      desc: '',
      args: [],
    );
  }

  /// `Year field shouldn't be empty`
  String get yearFieldShouldnTBeEmpty {
    return Intl.message(
      'Year field shouldn\'t be empty',
      name: 'yearFieldShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `You haven't selected any savings places`
  String get youHavenTSelectedAnySavingsPlaces {
    return Intl.message(
      'You haven\'t selected any savings places',
      name: 'youHavenTSelectedAnySavingsPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Do you use the internet?`
  String get youUseInternet {
    return Intl.message(
      'Do you use the internet?',
      name: 'youUseInternet',
      desc: '',
      args: [],
    );
  }

  /// `Cold storage field shoudn't be empty`
  String get coldStorageFieldShoudnTBeEmpty {
    return Intl.message(
      'Cold storage field shoudn\'t be empty',
      name: 'coldStorageFieldShoudnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `SoilTest Field shoudn't be empty`
  String get soilTestFieldShoudnTBeEmpty {
    return Intl.message(
      'SoilTest Field shoudn\'t be empty',
      name: 'soilTestFieldShoudnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `weather information shouldn't be empty`
  String get weatherInformationDiseaseInfestationAlertShouldnTBeEmpty {
    return Intl.message(
      'weather information shouldn\'t be empty',
      name: 'weatherInformationDiseaseInfestationAlertShouldnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Farmer helpline numbers shoudn't be empty`
  String get farmerHelplineNumbersShoudnTBeEmpty {
    return Intl.message(
      'Farmer helpline numbers shoudn\'t be empty',
      name: 'farmerHelplineNumbersShoudnTBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select at least one crop`
  String get selectAtLeastOneCrop {
    return Intl.message(
      'Select at least one crop',
      name: 'selectAtLeastOneCrop',
      desc: '',
      args: [],
    );
  }

  /// `Not Selected`
  String get notSelected {
    return Intl.message(
      'Not Selected',
      name: 'notSelected',
      desc: '',
      args: [],
    );
  }

  /// `Add Financial Info`
  String get addFinancialInfo {
    return Intl.message(
      'Add Financial Info',
      name: 'addFinancialInfo',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any need for cold storage?`
  String get doYouHaveAnyNeedForColdStorage {
    return Intl.message(
      'Do you have any need for cold storage?',
      name: 'doYouHaveAnyNeedForColdStorage',
      desc: '',
      args: [],
    );
  }

  /// `Labor Crisis`
  String get laborCrisis {
    return Intl.message(
      'Labor Crisis',
      name: 'laborCrisis',
      desc: '',
      args: [],
    );
  }

  /// `Soil test, weather info, training`
  String get soilTestWeatherInfoTraining {
    return Intl.message(
      'Soil test, weather info, training',
      name: 'soilTestWeatherInfoTraining',
      desc: '',
      args: [],
    );
  }

  /// `Machine Services (land preparation, tractor, harvester)`
  String get machineServicesLandPreparationTractorHarvester {
    return Intl.message(
      'Machine Services (land preparation, tractor, harvester)',
      name: 'machineServicesLandPreparationTractorHarvester',
      desc: '',
      args: [],
    );
  }

  /// `Unavailability of genuine inputs (seed, fertilizer, pesticide)`
  String get unavailabilityOfGenuineInputsSeedFertilizerPesticide {
    return Intl.message(
      'Unavailability of genuine inputs (seed, fertilizer, pesticide)',
      name: 'unavailabilityOfGenuineInputsSeedFertilizerPesticide',
      desc: '',
      args: [],
    );
  }

  /// `Add Farmers problems`
  String get addFarmersProblems {
    return Intl.message(
      'Add Farmers problems',
      name: 'addFarmersProblems',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test, Prescription & Training`
  String get soilTestPrescriptionTraining {
    return Intl.message(
      'Soil Test, Prescription & Training',
      name: 'soilTestPrescriptionTraining',
      desc: '',
      args: [],
    );
  }

  /// `Seed rate`
  String get seedPerDecimal {
    return Intl.message(
      'Seed rate',
      name: 'seedPerDecimal',
      desc: '',
      args: [],
    );
  }

  /// `Potential yield`
  String get potentialYield {
    return Intl.message(
      'Potential yield',
      name: 'potentialYield',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Pesticide`
  String get pesticideName {
    return Intl.message('Pesticide', name: 'pesticideName', desc: '', args: []);
  }

  /// `Generic name`
  String get genericName {
    return Intl.message(
      'Generic name',
      name: 'genericName',
      desc: '',
      args: [],
    );
  }

  /// `Application level`
  String get applicationLevel {
    return Intl.message(
      'Application level',
      name: 'applicationLevel',
      desc: '',
      args: [],
    );
  }

  /// `Amount of pesticides`
  String get amountOfPesticides {
    return Intl.message(
      'Amount of pesticides',
      name: 'amountOfPesticides',
      desc: '',
      args: [],
    );
  }

  /// `Herbicide Suggestion`
  String get herbicideSuggestion {
    return Intl.message(
      'Herbicide Suggestion',
      name: 'herbicideSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Fungicide Suggestion`
  String get fungicideSuggestion {
    return Intl.message(
      'Fungicide Suggestion',
      name: 'fungicideSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Insecticide Suggestion`
  String get insecticideSuggestion {
    return Intl.message(
      'Insecticide Suggestion',
      name: 'insecticideSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Required Seed`
  String get requiredSeed {
    return Intl.message(
      'Required Seed',
      name: 'requiredSeed',
      desc: '',
      args: [],
    );
  }

  /// `Required Fertilizer`
  String get requiredFertilizer {
    return Intl.message(
      'Required Fertilizer',
      name: 'requiredFertilizer',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amountNeeded {
    return Intl.message('Amount', name: 'amountNeeded', desc: '', args: []);
  }

  /// `Cost/Unit`
  String get costPerUnit {
    return Intl.message('Cost/Unit', name: 'costPerUnit', desc: '', args: []);
  }

  /// `Cost`
  String get cost {
    return Intl.message('Cost', name: 'cost', desc: '', args: []);
  }

  /// `TK`
  String get taka {
    return Intl.message('TK', name: 'taka', desc: '', args: []);
  }

  /// `Resize photo`
  String get cropper {
    return Intl.message('Resize photo', name: 'cropper', desc: '', args: []);
  }

  /// `Select your Language`
  String get switchLanguage {
    return Intl.message(
      'Select your Language',
      name: 'switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Sync completed`
  String get syncCompleted {
    return Intl.message(
      'Sync completed',
      name: 'syncCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Sync not completed`
  String get syncNotCompleted {
    return Intl.message(
      'Sync not completed',
      name: 'syncNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Location detected successfully`
  String get locationSetSuccessfully {
    return Intl.message(
      'Location detected successfully',
      name: 'locationSetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Current Photo`
  String get existingImage {
    return Intl.message(
      'Current Photo',
      name: 'existingImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Open Camera`
  String get openCamera {
    return Intl.message('Open Camera', name: 'openCamera', desc: '', args: []);
  }

  /// `Add Information`
  String get addinformation {
    return Intl.message(
      'Add Information',
      name: 'addinformation',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishList {
    return Intl.message('Wishlist', name: 'wishList', desc: '', args: []);
  }

  /// `SFID Card`
  String get sfidCard {
    return Intl.message('SFID Card', name: 'sfidCard', desc: '', args: []);
  }

  /// `Create Wishlist`
  String get createWishList {
    return Intl.message(
      'Create Wishlist',
      name: 'createWishList',
      desc: '',
      args: [],
    );
  }

  /// `Detail Information`
  String get detailInformation {
    return Intl.message(
      'Detail Information',
      name: 'detailInformation',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message('Features', name: 'features', desc: '', args: []);
  }

  /// `Select Feature`
  String get selectFeature {
    return Intl.message(
      'Select Feature',
      name: 'selectFeature',
      desc: '',
      args: [],
    );
  }

  /// `Crop Steps`
  String get cropSteps {
    return Intl.message('Crop Steps', name: 'cropSteps', desc: '', args: []);
  }

  /// `Mound/Bigha`
  String get moundperBigha {
    return Intl.message(
      'Mound/Bigha',
      name: 'moundperBigha',
      desc: '',
      args: [],
    );
  }

  /// `Tk/Mound`
  String get tkpermound {
    return Intl.message('Tk/Mound', name: 'tkpermound', desc: '', args: []);
  }

  /// `Project List`
  String get projectList {
    return Intl.message(
      'Project List',
      name: 'projectList',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `End Date`
  String get endDate {
    return Intl.message('End Date', name: 'endDate', desc: '', args: []);
  }

  /// `Total Farmer`
  String get totalFarmer {
    return Intl.message(
      'Total Farmer',
      name: 'totalFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get budget {
    return Intl.message('Budget', name: 'budget', desc: '', args: []);
  }

  /// `Group List`
  String get groupList {
    return Intl.message('Group List', name: 'groupList', desc: '', args: []);
  }

  /// `Capital per farmer`
  String get capitalPerfarmer {
    return Intl.message(
      'Capital per farmer',
      name: 'capitalPerfarmer',
      desc: '',
      args: [],
    );
  }

  /// `Group name`
  String get groupName {
    return Intl.message('Group name', name: 'groupName', desc: '', args: []);
  }

  /// `Reimburse`
  String get reimburse {
    return Intl.message('Reimburse', name: 'reimburse', desc: '', args: []);
  }

  /// `Disbursement`
  String get disbursement {
    return Intl.message(
      'Disbursement',
      name: 'disbursement',
      desc: '',
      args: [],
    );
  }

  /// `Dispatched`
  String get dispatched {
    return Intl.message('Dispatched', name: 'dispatched', desc: '', args: []);
  }

  /// `Due`
  String get due {
    return Intl.message('Due', name: 'due', desc: '', args: []);
  }

  /// `Extend Date`
  String get exendDate {
    return Intl.message('Extend Date', name: 'exendDate', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Reimburse History`
  String get disbursementHistory {
    return Intl.message(
      'Reimburse History',
      name: 'disbursementHistory',
      desc: '',
      args: [],
    );
  }

  /// `Disbursement History`
  String get reimburseHistory {
    return Intl.message(
      'Disbursement History',
      name: 'reimburseHistory',
      desc: '',
      args: [],
    );
  }

  /// `Add Disbursement`
  String get adddisbursement {
    return Intl.message(
      'Add Disbursement',
      name: 'adddisbursement',
      desc: '',
      args: [],
    );
  }

  /// `Add Reimburse`
  String get addRemburse {
    return Intl.message(
      'Add Reimburse',
      name: 'addRemburse',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Number`
  String get invalidNumber {
    return Intl.message(
      'Invalid Number',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Land amount details`
  String get landAmountDetails {
    return Intl.message(
      'Land amount details',
      name: 'landAmountDetails',
      desc: '',
      args: [],
    );
  }

  /// `Lease`
  String get lease {
    return Intl.message('Lease', name: 'lease', desc: '', args: []);
  }

  /// `Own`
  String get own {
    return Intl.message('Own', name: 'own', desc: '', args: []);
  }

  /// `Profit share`
  String get profitShare {
    return Intl.message(
      'Profit share',
      name: 'profitShare',
      desc: '',
      args: [],
    );
  }

  /// `By money`
  String get byMoney {
    return Intl.message('By money', name: 'byMoney', desc: '', args: []);
  }

  /// `Amount of money`
  String get amountOfMoney {
    return Intl.message(
      'Amount of money',
      name: 'amountOfMoney',
      desc: '',
      args: [],
    );
  }

  /// `1/4-(25%)`
  String get twintyfivePercent {
    return Intl.message(
      '1/4-(25%)',
      name: 'twintyfivePercent',
      desc: '',
      args: [],
    );
  }

  /// `1/3-(33%)`
  String get thartyThreePercent {
    return Intl.message(
      '1/3-(33%)',
      name: 'thartyThreePercent',
      desc: '',
      args: [],
    );
  }

  /// `1/2-(50%)`
  String get fiftyPercent {
    return Intl.message('1/2-(50%)', name: 'fiftyPercent', desc: '', args: []);
  }

  /// `2/3-66%`
  String get sixtySixPercent {
    return Intl.message('2/3-66%', name: 'sixtySixPercent', desc: '', args: []);
  }

  /// `Select method of paying for lease land`
  String get selectPaymentMethod {
    return Intl.message(
      'Select method of paying for lease land',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Select land type`
  String get selectLandType {
    return Intl.message(
      'Select land type',
      name: 'selectLandType',
      desc: '',
      args: [],
    );
  }

  /// `Own land amount`
  String get ownLandAmount {
    return Intl.message(
      'Own land amount',
      name: 'ownLandAmount',
      desc: '',
      args: [],
    );
  }

  /// `Lease land amount`
  String get leaseLandAmount {
    return Intl.message(
      'Lease land amount',
      name: 'leaseLandAmount',
      desc: '',
      args: [],
    );
  }

  /// `Cost of lease land`
  String get costOfLeaseLand {
    return Intl.message(
      'Cost of lease land',
      name: 'costOfLeaseLand',
      desc: '',
      args: [],
    );
  }

  /// `Select profit share percentage`
  String get selectProfitSharePercentage {
    return Intl.message(
      'Select profit share percentage',
      name: 'selectProfitSharePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Lease amount field shouldn't be empty`
  String get leaseLandAmountFileShouldntEmpty {
    return Intl.message(
      'Lease amount field shouldn\'t be empty',
      name: 'leaseLandAmountFileShouldntEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Own amount field shouldn't be empty`
  String get ownLandAmountFieldShouldntEmpty {
    return Intl.message(
      'Own amount field shouldn\'t be empty',
      name: 'ownLandAmountFieldShouldntEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Cost of lease field shouldn't be empty`
  String get costOfLeaseLandFieldShouldntEmpty {
    return Intl.message(
      'Cost of lease field shouldn\'t be empty',
      name: 'costOfLeaseLandFieldShouldntEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add NID information`
  String get addNidInformation {
    return Intl.message(
      'Add NID information',
      name: 'addNidInformation',
      desc: '',
      args: [],
    );
  }

  /// `NID front side`
  String get nidFrontSide {
    return Intl.message(
      'NID front side',
      name: 'nidFrontSide',
      desc: '',
      args: [],
    );
  }

  /// `NID back side`
  String get nidBackSide {
    return Intl.message(
      'NID back side',
      name: 'nidBackSide',
      desc: '',
      args: [],
    );
  }

  /// `NID`
  String get nid {
    return Intl.message('NID', name: 'nid', desc: '', args: []);
  }

  /// `Select share percentage`
  String get selectprofileshare {
    return Intl.message(
      'Select share percentage',
      name: 'selectprofileshare',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Approximate price`
  String get approximatPrice {
    return Intl.message(
      'Approximate price',
      name: 'approximatPrice',
      desc: '',
      args: [],
    );
  }

  /// `Can Read & Write`
  String get canReadAndWrite {
    return Intl.message(
      'Can Read & Write',
      name: 'canReadAndWrite',
      desc: '',
      args: [],
    );
  }

  /// `Can’t read & Write`
  String get canNotReadWrite {
    return Intl.message(
      'Can’t read & Write',
      name: 'canNotReadWrite',
      desc: '',
      args: [],
    );
  }

  /// `Variety name`
  String get varietyName {
    return Intl.message(
      'Variety name',
      name: 'varietyName',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any tests yet`
  String get addanyTestFirst {
    return Intl.message(
      'You haven\'t added any tests yet',
      name: 'addanyTestFirst',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get family {
    return Intl.message('Family', name: 'family', desc: '', args: []);
  }

  /// `Scientific Name`
  String get scientificName {
    return Intl.message(
      'Scientific Name',
      name: 'scientificName',
      desc: '',
      args: [],
    );
  }

  /// `Crop Profile`
  String get cropProfile {
    return Intl.message(
      'Crop Profile',
      name: 'cropProfile',
      desc: '',
      args: [],
    );
  }

  /// `Pest and disease`
  String get pestAndDisease {
    return Intl.message(
      'Pest and disease',
      name: 'pestAndDisease',
      desc: '',
      args: [],
    );
  }

  /// `Crop info`
  String get cropInfo {
    return Intl.message('Crop info', name: 'cropInfo', desc: '', args: []);
  }

  /// `Herbicide`
  String get herbicide {
    return Intl.message('Herbicide', name: 'herbicide', desc: '', args: []);
  }

  /// `Fungicide`
  String get fungicide {
    return Intl.message('Fungicide', name: 'fungicide', desc: '', args: []);
  }

  /// `Insecticide`
  String get insecticide {
    return Intl.message('Insecticide', name: 'insecticide', desc: '', args: []);
  }

  /// `Crop variety`
  String get cropvariety {
    return Intl.message(
      'Crop variety',
      name: 'cropvariety',
      desc: '',
      args: [],
    );
  }

  /// `Disease name`
  String get diseaseName {
    return Intl.message(
      'Disease name',
      name: 'diseaseName',
      desc: '',
      args: [],
    );
  }

  /// `Insect name`
  String get insectName {
    return Intl.message('Insect name', name: 'insectName', desc: '', args: []);
  }

  /// `Disease Type`
  String get diseaseType {
    return Intl.message(
      'Disease Type',
      name: 'diseaseType',
      desc: '',
      args: [],
    );
  }

  /// `Nature of Damage`
  String get natureOfDamage {
    return Intl.message(
      'Nature of Damage',
      name: 'natureOfDamage',
      desc: '',
      args: [],
    );
  }

  /// `Control Measure`
  String get controlMeasure {
    return Intl.message(
      'Control Measure',
      name: 'controlMeasure',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Crop Category`
  String get cropCategory {
    return Intl.message(
      'Crop Category',
      name: 'cropCategory',
      desc: '',
      args: [],
    );
  }

  /// `Average Production`
  String get averageProduction {
    return Intl.message(
      'Average Production',
      name: 'averageProduction',
      desc: '',
      args: [],
    );
  }

  /// `Intercultural Operation`
  String get interculturalOperation {
    return Intl.message(
      'Intercultural Operation',
      name: 'interculturalOperation',
      desc: '',
      args: [],
    );
  }

  /// `Irrigation Information`
  String get irrigationInformation {
    return Intl.message(
      'Irrigation Information',
      name: 'irrigationInformation',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Information`
  String get fertilizerInfo {
    return Intl.message(
      'Fertilizer Information',
      name: 'fertilizerInfo',
      desc: '',
      args: [],
    );
  }

  /// `Harvesting and Preservation`
  String get harvesingAndPreservation {
    return Intl.message(
      'Harvesting and Preservation',
      name: 'harvesingAndPreservation',
      desc: '',
      args: [],
    );
  }

  /// `Seedbed`
  String get seedbed {
    return Intl.message('Seedbed', name: 'seedbed', desc: '', args: []);
  }

  /// `Land preparation`
  String get lanPreparation {
    return Intl.message(
      'Land preparation',
      name: 'lanPreparation',
      desc: '',
      args: [],
    );
  }

  /// `Showing Method`
  String get showingMethod {
    return Intl.message(
      'Showing Method',
      name: 'showingMethod',
      desc: '',
      args: [],
    );
  }

  /// `Seed treatment`
  String get seedTreatment {
    return Intl.message(
      'Seed treatment',
      name: 'seedTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Seed Rate`
  String get seedRate {
    return Intl.message('Seed Rate', name: 'seedRate', desc: '', args: []);
  }

  /// `Seed Information`
  String get seedInformation {
    return Intl.message(
      'Seed Information',
      name: 'seedInformation',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get climateGenInfo {
    return Intl.message(
      'General Information',
      name: 'climateGenInfo',
      desc: '',
      args: [],
    );
  }

  /// `Land Type`
  String get landType {
    return Intl.message('Land Type', name: 'landType', desc: '', args: []);
  }

  /// `Rainfall`
  String get climateRainfall {
    return Intl.message(
      'Rainfall',
      name: 'climateRainfall',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get climateHumidity {
    return Intl.message(
      'Humidity',
      name: 'climateHumidity',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get climateTemperature {
    return Intl.message(
      'Temperature',
      name: 'climateTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Soil pH`
  String get soilPh {
    return Intl.message('Soil pH', name: 'soilPh', desc: '', args: []);
  }

  /// `Soil and Climate Information`
  String get soilAndClimateInfo {
    return Intl.message(
      'Soil and Climate Information',
      name: 'soilAndClimateInfo',
      desc: '',
      args: [],
    );
  }

  /// `Service center`
  String get serviceCenter {
    return Intl.message(
      'Service center',
      name: 'serviceCenter',
      desc: '',
      args: [],
    );
  }

  /// `Select service center`
  String get selectServiceCenter {
    return Intl.message(
      'Select service center',
      name: 'selectServiceCenter',
      desc: '',
      args: [],
    );
  }

  /// `Card assignment successful`
  String get cardAssignmentSuccesfull {
    return Intl.message(
      'Card assignment successful',
      name: 'cardAssignmentSuccesfull',
      desc: '',
      args: [],
    );
  }

  /// `Card is already assigned`
  String get cardIsAlreadyAssigned {
    return Intl.message(
      'Card is already assigned',
      name: 'cardIsAlreadyAssigned',
      desc: '',
      args: [],
    );
  }

  /// `Sync SFID from Web`
  String get syncSfidFromWeb {
    return Intl.message(
      'Sync SFID from Web',
      name: 'syncSfidFromWeb',
      desc: '',
      args: [],
    );
  }

  /// `Add Test`
  String get addTest {
    return Intl.message('Add Test', name: 'addTest', desc: '', args: []);
  }

  /// `Test Items`
  String get allSoilTests {
    return Intl.message('Test Items', name: 'allSoilTests', desc: '', args: []);
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Result`
  String get result {
    return Intl.message('Result', name: 'result', desc: '', args: []);
  }

  /// `Connect with Aunkur`
  String get connectWithAunkur {
    return Intl.message(
      'Connect with Aunkur',
      name: 'connectWithAunkur',
      desc: '',
      args: [],
    );
  }

  /// `Data from Aunkur`
  String get dataFromAunkur {
    return Intl.message(
      'Data from Aunkur',
      name: 'dataFromAunkur',
      desc: '',
      args: [],
    );
  }

  /// `Aunkur manual test`
  String get aunkurManualTest {
    return Intl.message(
      'Aunkur manual test',
      name: 'aunkurManualTest',
      desc: '',
      args: [],
    );
  }

  /// `Add New Test`
  String get testList {
    return Intl.message('Add New Test', name: 'testList', desc: '', args: []);
  }

  /// `Need more test`
  String get needMoreTest {
    return Intl.message(
      'Need more test',
      name: 'needMoreTest',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Language`
  String get choiceYourLanguage {
    return Intl.message(
      'Choose Your Language',
      name: 'choiceYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kg {
    return Intl.message('kg', name: 'kg', desc: '', args: []);
  }

  /// `gm`
  String get gm {
    return Intl.message('gm', name: 'gm', desc: '', args: []);
  }

  /// `Sorry! You're offline`
  String get sorryYouAreOffline {
    return Intl.message(
      'Sorry! You\'re offline',
      name: 'sorryYouAreOffline',
      desc: '',
      args: [],
    );
  }

  /// `Mortgage`
  String get mortgage {
    return Intl.message('Mortgage', name: 'mortgage', desc: '', args: []);
  }

  /// `Amount of mortgaged land`
  String get mortgageLandAmount {
    return Intl.message(
      'Amount of mortgaged land',
      name: 'mortgageLandAmount',
      desc: '',
      args: [],
    );
  }

  /// `Cattle rearing`
  String get cattleRearing {
    return Intl.message(
      'Cattle rearing',
      name: 'cattleRearing',
      desc: '',
      args: [],
    );
  }

  /// `Number of cows`
  String get noumberOfCows {
    return Intl.message(
      'Number of cows',
      name: 'noumberOfCows',
      desc: '',
      args: [],
    );
  }

  /// `Number of goats`
  String get numberOfGoat {
    return Intl.message(
      'Number of goats',
      name: 'numberOfGoat',
      desc: '',
      args: [],
    );
  }

  /// `Goats`
  String get goats {
    return Intl.message('Goats', name: 'goats', desc: '', args: []);
  }

  /// `Cows`
  String get cows {
    return Intl.message('Cows', name: 'cows', desc: '', args: []);
  }

  /// `Money Return for lease`
  String get moneyReturnForLease {
    return Intl.message(
      'Money Return for lease',
      name: 'moneyReturnForLease',
      desc: '',
      args: [],
    );
  }

  /// `Assign RFID`
  String get assignRFID {
    return Intl.message('Assign RFID', name: 'assignRFID', desc: '', args: []);
  }

  /// `Unassing RFID`
  String get unassignRFID {
    return Intl.message(
      'Unassing RFID',
      name: 'unassignRFID',
      desc: '',
      args: [],
    );
  }

  /// `Assign status`
  String get assignStatus {
    return Intl.message(
      'Assign status',
      name: 'assignStatus',
      desc: '',
      args: [],
    );
  }

  /// `Packet/Bottle`
  String get aacketBottle {
    return Intl.message(
      'Packet/Bottle',
      name: 'aacketBottle',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Fill up no of cows`
  String get pleaseFillUpNoOfcows {
    return Intl.message(
      'Fill up no of cows',
      name: 'pleaseFillUpNoOfcows',
      desc: '',
      args: [],
    );
  }

  /// `Fill up no of goats.`
  String get pleaseFillupNoOfGots {
    return Intl.message(
      'Fill up no of goats.',
      name: 'pleaseFillupNoOfGots',
      desc: '',
      args: [],
    );
  }

  /// `Sowing Method`
  String get sowingMethod {
    return Intl.message(
      'Sowing Method',
      name: 'sowingMethod',
      desc: '',
      args: [],
    );
  }

  /// `Soil Texture`
  String get soilTexture {
    return Intl.message(
      'Soil Texture',
      name: 'soilTexture',
      desc: '',
      args: [],
    );
  }

  /// `Salinity`
  String get salinity {
    return Intl.message('Salinity', name: 'salinity', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `This phone number already exists`
  String get thisPhoneNumberAlreadyExists {
    return Intl.message(
      'This phone number already exists',
      name: 'thisPhoneNumberAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `This NID already exists`
  String get thisNidAlreadyExists {
    return Intl.message(
      'This NID already exists',
      name: 'thisNidAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Add farmer problem`
  String get addFarmerProblem {
    return Intl.message(
      'Add farmer problem',
      name: 'addFarmerProblem',
      desc: '',
      args: [],
    );
  }

  /// `Possible Price`
  String get possiblePrice {
    return Intl.message(
      'Possible Price',
      name: 'possiblePrice',
      desc: '',
      args: [],
    );
  }

  /// `Variety`
  String get cropVarieties {
    return Intl.message('Variety', name: 'cropVarieties', desc: '', args: []);
  }

  /// `Seedline Cost/Dec`
  String get seedlingCost {
    return Intl.message(
      'Seedline Cost/Dec',
      name: 'seedlingCost',
      desc: '',
      args: [],
    );
  }

  /// `Not necessary`
  String get notNecessary {
    return Intl.message(
      'Not necessary',
      name: 'notNecessary',
      desc: '',
      args: [],
    );
  }

  /// `Piece`
  String get piece {
    return Intl.message('Piece', name: 'piece', desc: '', args: []);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `News Portal`
  String get newsPortal {
    return Intl.message('News Portal', name: 'newsPortal', desc: '', args: []);
  }

  /// `Your current location`
  String get yourCurrentLocation {
    return Intl.message(
      'Your current location',
      name: 'yourCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get latestNews {
    return Intl.message('Latest News', name: 'latestNews', desc: '', args: []);
  }

  /// `Test No`
  String get test_no {
    return Intl.message('Test No', name: 'test_no', desc: '', args: []);
  }

  /// `Select aez value`
  String get selectAez {
    return Intl.message(
      'Select aez value',
      name: 'selectAez',
      desc: '',
      args: [],
    );
  }

  /// `Test info no`
  String get info_no {
    return Intl.message('Test info no', name: 'info_no', desc: '', args: []);
  }

  /// `Update NID Information`
  String get updateNidInfo {
    return Intl.message(
      'Update NID Information',
      name: 'updateNidInfo',
      desc: '',
      args: [],
    );
  }

  /// `NID Information`
  String get nidInformation {
    return Intl.message(
      'NID Information',
      name: 'nidInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add Module`
  String get addModule {
    return Intl.message('Add Module', name: 'addModule', desc: '', args: []);
  }

  /// `Email shouldn’t be empty`
  String get emailShouldnotBeEmpty {
    return Intl.message(
      'Email shouldn’t be empty',
      name: 'emailShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email is not valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Password shouldn’t be empty`
  String get passwordShouldnotBeEmpty {
    return Intl.message(
      'Password shouldn’t be empty',
      name: 'passwordShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMustBeAtLeast8Characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMustBeAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Name shouldn’t be empty`
  String get nameShouldnotBeEmpty {
    return Intl.message(
      'Name shouldn’t be empty',
      name: 'nameShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Phone shouldn’t be empty`
  String get phoneShouldnotBeEmpty {
    return Intl.message(
      'Phone shouldn’t be empty',
      name: 'phoneShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Phone must be at least 11 characters`
  String get phoneMustBeAtLeast11Characters {
    return Intl.message(
      'Phone must be at least 11 characters',
      name: 'phoneMustBeAtLeast11Characters',
      desc: '',
      args: [],
    );
  }

  /// `Company name shouldn’t be empty`
  String get companyNameShouldnotBeEmpty {
    return Intl.message(
      'Company name shouldn’t be empty',
      name: 'companyNameShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Organization number shouldn’t be empty`
  String get organizationNumberShouldnotBeEmpty {
    return Intl.message(
      'Organization number shouldn’t be empty',
      name: 'organizationNumberShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Partner type shouldn’t be empty`
  String get partnerTypeShouldnotBeEmpty {
    return Intl.message(
      'Partner type shouldn’t be empty',
      name: 'partnerTypeShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Feature shouldn’t be empty`
  String get featureShouldnotBeEmpty {
    return Intl.message(
      'Feature shouldn’t be empty',
      name: 'featureShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Contact person shouldn’t be empty`
  String get contactPersonShouldnotBeEmpty {
    return Intl.message(
      'Contact person shouldn’t be empty',
      name: 'contactPersonShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Contact person phone shouldn’t be empty`
  String get contactPersonPhoneShouldnotBeEmpty {
    return Intl.message(
      'Contact person phone shouldn’t be empty',
      name: 'contactPersonPhoneShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Division shouldn’t be empty`
  String get divisionShouldnotBeEmpty {
    return Intl.message(
      'Division shouldn’t be empty',
      name: 'divisionShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `District shouldn’t be empty`
  String get districtShouldnotBeEmpty {
    return Intl.message(
      'District shouldn’t be empty',
      name: 'districtShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Address shouldn’t be empty`
  String get addressShouldnotBeEmpty {
    return Intl.message(
      'Address shouldn’t be empty',
      name: 'addressShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select partner Type`
  String get partnerType {
    return Intl.message(
      'Select partner Type',
      name: 'partnerType',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Name`
  String get contactPersonName {
    return Intl.message(
      'Contact Person Name',
      name: 'contactPersonName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Phone`
  String get contactPersonPhone {
    return Intl.message(
      'Contact Person Phone',
      name: 'contactPersonPhone',
      desc: '',
      args: [],
    );
  }

  /// `Organization Number`
  String get organizationNumber {
    return Intl.message(
      'Organization Number',
      name: 'organizationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `Capital Partner`
  String get capitalPartner {
    return Intl.message(
      'Capital Partner',
      name: 'capitalPartner',
      desc: '',
      args: [],
    );
  }

  /// `Input Partner`
  String get inputPartner {
    return Intl.message(
      'Input Partner',
      name: 'inputPartner',
      desc: '',
      args: [],
    );
  }

  /// `Machine Partner`
  String get machinePartner {
    return Intl.message(
      'Machine Partner',
      name: 'machinePartner',
      desc: '',
      args: [],
    );
  }

  /// `TIN`
  String get tin {
    return Intl.message('TIN', name: 'tin', desc: '', args: []);
  }

  /// `TIN shouldn’t be empty`
  String get tinShouldnotBeEmpty {
    return Intl.message(
      'TIN shouldn’t be empty',
      name: 'tinShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `BIN`
  String get bin {
    return Intl.message('BIN', name: 'bin', desc: '', args: []);
  }

  /// `BIN shouldn’t be empty`
  String get binShouldnotBeEmpty {
    return Intl.message(
      'BIN shouldn’t be empty',
      name: 'binShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `MFI`
  String get mfi {
    return Intl.message('MFI', name: 'mfi', desc: '', args: []);
  }

  /// `MFI shouldn’t be empty`
  String get mfiShouldnotBeEmpty {
    return Intl.message(
      'MFI shouldn’t be empty',
      name: 'mfiShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Trade License`
  String get tradeLicense {
    return Intl.message(
      'Trade License',
      name: 'tradeLicense',
      desc: '',
      args: [],
    );
  }

  /// `Trade License shouldn’t be empty`
  String get tradeLicenseShouldnotBeEmpty {
    return Intl.message(
      'Trade License shouldn’t be empty',
      name: 'tradeLicenseShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Succesfull`
  String get succesfull {
    return Intl.message('Succesfull', name: 'succesfull', desc: '', args: []);
  }

  /// `Partner Image`
  String get partnerImage {
    return Intl.message(
      'Partner Image',
      name: 'partnerImage',
      desc: '',
      args: [],
    );
  }

  /// `Outlet Cover Image`
  String get outletCoverImage {
    return Intl.message(
      'Outlet Cover Image',
      name: 'outletCoverImage',
      desc: '',
      args: [],
    );
  }

  /// `Partner Created Successfully`
  String get partnerCreatedSuccessfully {
    return Intl.message(
      'Partner Created Successfully',
      name: 'partnerCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Partner Updated Successfully`
  String get partnerUpdatedSuccessfully {
    return Intl.message(
      'Partner Updated Successfully',
      name: 'partnerUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Partner Deleted Successfully`
  String get partnerDeletedSuccessfully {
    return Intl.message(
      'Partner Deleted Successfully',
      name: 'partnerDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Partner Created Failed`
  String get partnerCreatedFailed {
    return Intl.message(
      'Partner Created Failed',
      name: 'partnerCreatedFailed',
      desc: '',
      args: [],
    );
  }

  /// `Partner Updated Failed`
  String get partnerUpdatedFailed {
    return Intl.message(
      'Partner Updated Failed',
      name: 'partnerUpdatedFailed',
      desc: '',
      args: [],
    );
  }

  /// `Partner Deleted Failed`
  String get partnerDeletedFailed {
    return Intl.message(
      'Partner Deleted Failed',
      name: 'partnerDeletedFailed',
      desc: '',
      args: [],
    );
  }

  /// `Additional information`
  String get additionalInfo {
    return Intl.message(
      'Additional information',
      name: 'additionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Crop-wise Farmers`
  String get cropWiseFarmerChart {
    return Intl.message(
      'Crop-wise Farmers',
      name: 'cropWiseFarmerChart',
      desc: '',
      args: [],
    );
  }

  /// `people`
  String get people {
    return Intl.message('people', name: 'people', desc: '', args: []);
  }

  /// `Total Farmers`
  String get noOfFarmers {
    return Intl.message(
      'Total Farmers',
      name: 'noOfFarmers',
      desc: '',
      args: [],
    );
  }

  /// `Total Crops`
  String get noOfCrops {
    return Intl.message('Total Crops', name: 'noOfCrops', desc: '', args: []);
  }

  /// `Input`
  String get noOfInputs {
    return Intl.message('Input', name: 'noOfInputs', desc: '', args: []);
  }

  /// `Mechanical`
  String get noOfMechanicals {
    return Intl.message(
      'Mechanical',
      name: 'noOfMechanicals',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get noOfFianance {
    return Intl.message('Finance', name: 'noOfFianance', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `See all`
  String get seeAll {
    return Intl.message('See all', name: 'seeAll', desc: '', args: []);
  }

  /// `Assign Machine Partner`
  String get assignMachinePartner {
    return Intl.message(
      'Assign Machine Partner',
      name: 'assignMachinePartner',
      desc: '',
      args: [],
    );
  }

  /// `Assign Input Partner`
  String get assignInputPartner {
    return Intl.message(
      'Assign Input Partner',
      name: 'assignInputPartner',
      desc: '',
      args: [],
    );
  }

  /// `Assign`
  String get assign {
    return Intl.message('Assign', name: 'assign', desc: '', args: []);
  }

  /// `Select Machine Type`
  String get selectMachineType {
    return Intl.message(
      'Select Machine Type',
      name: 'selectMachineType',
      desc: '',
      args: [],
    );
  }

  /// `Select Partner Type`
  String get selectPartnerType {
    return Intl.message(
      'Select Partner Type',
      name: 'selectPartnerType',
      desc: '',
      args: [],
    );
  }

  /// `Select Service Area`
  String get selectServiceArea {
    return Intl.message(
      'Select Service Area',
      name: 'selectServiceArea',
      desc: '',
      args: [],
    );
  }

  /// `Pass or Distance`
  String get passOrDistance {
    return Intl.message(
      'Pass or Distance',
      name: 'passOrDistance',
      desc: '',
      args: [],
    );
  }

  /// `Pass or distance shouldn’t be empty`
  String get passDistanceShouldnotBeEmpty {
    return Intl.message(
      'Pass or distance shouldn’t be empty',
      name: 'passDistanceShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select Unit`
  String get selectUnit {
    return Intl.message('Select Unit', name: 'selectUnit', desc: '', args: []);
  }

  /// `Weight Or Sack`
  String get weightOrSack {
    return Intl.message(
      'Weight Or Sack',
      name: 'weightOrSack',
      desc: '',
      args: [],
    );
  }

  /// `Weight or sack shouldn’t be empty`
  String get weightSackShouldnotBeEmpty {
    return Intl.message(
      'Weight or sack shouldn’t be empty',
      name: 'weightSackShouldnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Search here by area name`
  String get searchHereByAreaName {
    return Intl.message(
      'Search here by area name',
      name: 'searchHereByAreaName',
      desc: '',
      args: [],
    );
  }

  /// `Search here by machine type or farmer name`
  String get searchHereByMachineTypeOrFarmerName {
    return Intl.message(
      'Search here by machine type or farmer name',
      name: 'searchHereByMachineTypeOrFarmerName',
      desc: '',
      args: [],
    );
  }

  /// `New Mech.Service`
  String get newMachineService {
    return Intl.message(
      'New Mech.Service',
      name: 'newMachineService',
      desc: '',
      args: [],
    );
  }

  /// `Mechanical Requests`
  String get mechanicalRequests {
    return Intl.message(
      'Mechanical Requests',
      name: 'mechanicalRequests',
      desc: '',
      args: [],
    );
  }

  /// `New Group`
  String get newGroup {
    return Intl.message('New Group', name: 'newGroup', desc: '', args: []);
  }

  /// `Machine Area`
  String get machineArea {
    return Intl.message(
      'Machine Area',
      name: 'machineArea',
      desc: '',
      args: [],
    );
  }

  /// `Machine Request`
  String get machineRequest {
    return Intl.message(
      'Machine Request',
      name: 'machineRequest',
      desc: '',
      args: [],
    );
  }

  /// `Not Assign Yet`
  String get notAssignYet {
    return Intl.message(
      'Not Assign Yet',
      name: 'notAssignYet',
      desc: '',
      args: [],
    );
  }

  /// `Please select a partner to assign`
  String get pleaseSelectAPartnerToAssign {
    return Intl.message(
      'Please select a partner to assign',
      name: 'pleaseSelectAPartnerToAssign',
      desc: '',
      args: [],
    );
  }

  /// `Select Farming Practice`
  String get selectFarmingPractice {
    return Intl.message(
      'Select Farming Practice',
      name: 'selectFarmingPractice',
      desc: '',
      args: [],
    );
  }

  /// `Please select farming practice`
  String get pleaseSelectFarmingPractice {
    return Intl.message(
      'Please select farming practice',
      name: 'pleaseSelectFarmingPractice',
      desc: '',
      args: [],
    );
  }

  /// `No Notification Yet`
  String get noNotificationYet {
    return Intl.message(
      'No Notification Yet',
      name: 'noNotificationYet',
      desc: '',
      args: [],
    );
  }

  /// `Content is not available`
  String get contentIsNotAvailable {
    return Intl.message(
      'Content is not available',
      name: 'contentIsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Noon`
  String get goodNoon {
    return Intl.message('Good Noon', name: 'goodNoon', desc: '', args: []);
  }

  /// `Good Night`
  String get goodNight {
    return Intl.message('Good Night', name: 'goodNight', desc: '', args: []);
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `All Services`
  String get allServices {
    return Intl.message(
      'All Services',
      name: 'allServices',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message('FAQ', name: 'faq', desc: '', args: []);
  }

  /// `Helpline`
  String get helpline {
    return Intl.message('Helpline', name: 'helpline', desc: '', args: []);
  }

  /// `About iPAGE`
  String get aboutIpage {
    return Intl.message('About iPAGE', name: 'aboutIpage', desc: '', args: []);
  }

  /// `Applied Herbicide Suggestions`
  String get appliedHerbicideSuggestions {
    return Intl.message(
      'Applied Herbicide Suggestions',
      name: 'appliedHerbicideSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Applied Seed Suggestions`
  String get appliedSeedSuggestions {
    return Intl.message(
      'Applied Seed Suggestions',
      name: 'appliedSeedSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Applied Fertilizer Suggestions`
  String get appliedFertilizerSuggestions {
    return Intl.message(
      'Applied Fertilizer Suggestions',
      name: 'appliedFertilizerSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Applied Insecticide Suggestions`
  String get appliedInsecticideSuggestions {
    return Intl.message(
      'Applied Insecticide Suggestions',
      name: 'appliedInsecticideSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Applied Fungicide Suggestions`
  String get appliedFungicideSuggestions {
    return Intl.message(
      'Applied Fungicide Suggestions',
      name: 'appliedFungicideSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Updated information successfully.`
  String get updatedInfoSuccessfully {
    return Intl.message(
      'Updated information successfully.',
      name: 'updatedInfoSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Updated information Fail.`
  String get updatedInfoFailed {
    return Intl.message(
      'Updated information Fail.',
      name: 'updatedInfoFailed',
      desc: '',
      args: [],
    );
  }

  /// `Farmer not found`
  String get farmerNotFound {
    return Intl.message(
      'Farmer not found',
      name: 'farmerNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `School going member should not be more than total member`
  String get schoolGoingMemberShouldNotBeMoreThanTotalMember {
    return Intl.message(
      'School going member should not be more than total member',
      name: 'schoolGoingMemberShouldNotBeMoreThanTotalMember',
      desc: '',
      args: [],
    );
  }

  /// `Split Application`
  String get splitApplication {
    return Intl.message(
      'Split Application',
      name: 'splitApplication',
      desc: '',
      args: [],
    );
  }

  /// `Urea`
  String get urea {
    return Intl.message('Urea', name: 'urea', desc: '', args: []);
  }

  /// `TSP`
  String get tsp {
    return Intl.message('TSP', name: 'tsp', desc: '', args: []);
  }

  /// `MOP`
  String get mop {
    return Intl.message('MOP', name: 'mop', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `DAP`
  String get dap {
    return Intl.message('DAP', name: 'dap', desc: '', args: []);
  }

  /// `Gypsum`
  String get gypsum {
    return Intl.message('Gypsum', name: 'gypsum', desc: '', args: []);
  }

  /// `Password and confirm password does not match`
  String get passwordAndConfirmPasswordDoesNotMatch {
    return Intl.message(
      'Password and confirm password does not match',
      name: 'passwordAndConfirmPasswordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username should not be empty`
  String get usernameShouldNotBeEmpty {
    return Intl.message(
      'Username should not be empty',
      name: 'usernameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Gram`
  String get gram {
    return Intl.message('Gram', name: 'gram', desc: '', args: []);
  }

  /// `About iPAGE`
  String get about_ipage {
    return Intl.message('About iPAGE', name: 'about_ipage', desc: '', args: []);
  }

  /// `News Feed`
  String get newsFeed {
    return Intl.message('News Feed', name: 'newsFeed', desc: '', args: []);
  }

  /// `Service Area`
  String get serviceArea {
    return Intl.message(
      'Service Area',
      name: 'serviceArea',
      desc: '',
      args: [],
    );
  }

  /// `Help Line`
  String get helpLine {
    return Intl.message('Help Line', name: 'helpLine', desc: '', args: []);
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Gm/Plant`
  String get gmPerPlant {
    return Intl.message('Gm/Plant', name: 'gmPerPlant', desc: '', args: []);
  }

  /// `View Tested Sample`
  String get viewTestedSample {
    return Intl.message(
      'View Tested Sample',
      name: 'viewTestedSample',
      desc: '',
      args: [],
    );
  }

  /// `Soil Test In Progress`
  String get soilTestInProgress {
    return Intl.message(
      'Soil Test In Progress',
      name: 'soilTestInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Appled Instructions`
  String get fertilizerAppledInstructions {
    return Intl.message(
      'Fertilizer Appled Instructions',
      name: 'fertilizerAppledInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Zinc`
  String get zinc {
    return Intl.message('Zinc', name: 'zinc', desc: '', args: []);
  }

  /// `Boron`
  String get boron {
    return Intl.message('Boron', name: 'boron', desc: '', args: []);
  }

  /// `Do you want to proceed with the full and informative farmer registration process?`
  String get doYouWantToInfoReg {
    return Intl.message(
      'Do you want to proceed with the full and informative farmer registration process?',
      name: 'doYouWantToInfoReg',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Search Panel`
  String get farmerSearchPanel {
    return Intl.message(
      'Farmer Search Panel',
      name: 'farmerSearchPanel',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message('End', name: 'end', desc: '', args: []);
  }

  /// `Registration Date`
  String get registrationDate {
    return Intl.message(
      'Registration Date',
      name: 'registrationDate',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sync with cloud?`
  String get doYouWantToSyncWithCloud {
    return Intl.message(
      'Do you want to sync with cloud?',
      name: 'doYouWantToSyncWithCloud',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Sync`
  String get calcelSync {
    return Intl.message('Cancel Sync', name: 'calcelSync', desc: '', args: []);
  }

  /// `Syncing with cloud`
  String get syncIngWithCloud {
    return Intl.message(
      'Syncing with cloud',
      name: 'syncIngWithCloud',
      desc: '',
      args: [],
    );
  }

  /// `Cancelling sync...`
  String get calcelingSync {
    return Intl.message(
      'Cancelling sync...',
      name: 'calcelingSync',
      desc: '',
      args: [],
    );
  }

  /// `Total Completed`
  String get totalCompleted {
    return Intl.message(
      'Total Completed',
      name: 'totalCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Preparing division`
  String get prepareingDivision {
    return Intl.message(
      'Preparing division',
      name: 'prepareingDivision',
      desc: '',
      args: [],
    );
  }

  /// `Preparing district`
  String get prepareingDistrict {
    return Intl.message(
      'Preparing district',
      name: 'prepareingDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Preparing upazila`
  String get prepareingUpazila {
    return Intl.message(
      'Preparing upazila',
      name: 'prepareingUpazila',
      desc: '',
      args: [],
    );
  }

  /// `Preparing union`
  String get prepareingUnion {
    return Intl.message(
      'Preparing union',
      name: 'prepareingUnion',
      desc: '',
      args: [],
    );
  }

  /// `Preparing crops`
  String get prepareingCrops {
    return Intl.message(
      'Preparing crops',
      name: 'prepareingCrops',
      desc: '',
      args: [],
    );
  }

  /// `Preparing Crops Diseases`
  String get prepareingCropDisisease {
    return Intl.message(
      'Preparing Crops Diseases',
      name: 'prepareingCropDisisease',
      desc: '',
      args: [],
    );
  }

  /// `Preparing units`
  String get prepareingUnits {
    return Intl.message(
      'Preparing units',
      name: 'prepareingUnits',
      desc: '',
      args: [],
    );
  }

  /// `Preparing soil test`
  String get preparingSoilTest {
    return Intl.message(
      'Preparing soil test',
      name: 'preparingSoilTest',
      desc: '',
      args: [],
    );
  }

  /// `Preparing partner`
  String get preparingPartner {
    return Intl.message(
      'Preparing partner',
      name: 'preparingPartner',
      desc: '',
      args: [],
    );
  }

  /// `Preparing wish list`
  String get preparingWishList {
    return Intl.message(
      'Preparing wish list',
      name: 'preparingWishList',
      desc: '',
      args: [],
    );
  }

  /// `Preparing season`
  String get preparingSeason {
    return Intl.message(
      'Preparing season',
      name: 'preparingSeason',
      desc: '',
      args: [],
    );
  }

  /// `Preparing AEZs`
  String get preparingAezs {
    return Intl.message(
      'Preparing AEZs',
      name: 'preparingAezs',
      desc: '',
      args: [],
    );
  }

  /// `Preparing calibration factor`
  String get preparingCalibrationFactor {
    return Intl.message(
      'Preparing calibration factor',
      name: 'preparingCalibrationFactor',
      desc: '',
      args: [],
    );
  }

  /// `Preparing education`
  String get PreparingEducation {
    return Intl.message(
      'Preparing education',
      name: 'PreparingEducation',
      desc: '',
      args: [],
    );
  }

  /// `Preparing service center`
  String get preparingServiceCenter {
    return Intl.message(
      'Preparing service center',
      name: 'preparingServiceCenter',
      desc: '',
      args: [],
    );
  }

  /// `Preparing machine type`
  String get PreparingMachineType {
    return Intl.message(
      'Preparing machine type',
      name: 'PreparingMachineType',
      desc: '',
      args: [],
    );
  }

  /// `Preparing all partner`
  String get preparingAllPartner {
    return Intl.message(
      'Preparing all partner',
      name: 'preparingAllPartner',
      desc: '',
      args: [],
    );
  }

  /// `Preparing package`
  String get preparingPackage {
    return Intl.message(
      'Preparing package',
      name: 'preparingPackage',
      desc: '',
      args: [],
    );
  }

  /// `Preparing service area`
  String get preparingServiceArea {
    return Intl.message(
      'Preparing service area',
      name: 'preparingServiceArea',
      desc: '',
      args: [],
    );
  }

  /// `Preparing global product`
  String get preparingGlobalProduct {
    return Intl.message(
      'Preparing global product',
      name: 'preparingGlobalProduct',
      desc: '',
      args: [],
    );
  }

  /// `Preparing company`
  String get preparingCompany {
    return Intl.message(
      'Preparing company',
      name: 'preparingCompany',
      desc: '',
      args: [],
    );
  }

  /// `Preparing partner product`
  String get preparingPartnerProduct {
    return Intl.message(
      'Preparing partner product',
      name: 'preparingPartnerProduct',
      desc: '',
      args: [],
    );
  }

  /// `Preparing prescription`
  String get preparingPrescription {
    return Intl.message(
      'Preparing prescription',
      name: 'preparingPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Preparing farmer`
  String get preparingFarmer {
    return Intl.message(
      'Preparing farmer',
      name: 'preparingFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Preparing soil test info`
  String get preparingSoilTestInfo {
    return Intl.message(
      'Preparing soil test info',
      name: 'preparingSoilTestInfo',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get doYouWantToLogout {
    return Intl.message(
      'Do you want to logout?',
      name: 'doYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get plseaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'plseaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 character`
  String get passwordMustBeAtLeast6Character {
    return Intl.message(
      'Password must be at least 6 character',
      name: 'passwordMustBeAtLeast6Character',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sync farmer?`
  String get doYouWantToSyncFarmer {
    return Intl.message(
      'Do you want to sync farmer?',
      name: 'doYouWantToSyncFarmer',
      desc: '',
      args: [],
    );
  }

  /// `You have unsynced data. Please sync first`
  String get youHaveUnsyncedDataPleaseSyncFirst {
    return Intl.message(
      'You have unsynced data. Please sync first',
      name: 'youHaveUnsyncedDataPleaseSyncFirst',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Cart already distributed for this farmer.`
  String get cartAlreadyDistributedForThisFarmer {
    return Intl.message(
      'Cart already distributed for this farmer.',
      name: 'cartAlreadyDistributedForThisFarmer',
      desc: '',
      args: [],
    );
  }

  /// `If you re-assign.Previus card not worked for this farmer.`
  String get ifYouReAssignThePreviousCardNotWork {
    return Intl.message(
      'If you re-assign.Previus card not worked for this farmer.',
      name: 'ifYouReAssignThePreviousCardNotWork',
      desc: '',
      args: [],
    );
  }

  /// `Product successfully added to cart.`
  String get productAddedInCartSucces {
    return Intl.message(
      'Product successfully added to cart.',
      name: 'productAddedInCartSucces',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Product`
  String get purchaseProduct {
    return Intl.message(
      'Purchase Product',
      name: 'purchaseProduct',
      desc: '',
      args: [],
    );
  }

  /// `Proposed`
  String get proposed {
    return Intl.message('Proposed', name: 'proposed', desc: '', args: []);
  }

  /// `Primary`
  String get primary {
    return Intl.message('Primary', name: 'primary', desc: '', args: []);
  }

  /// `Head Quarters`
  String get headQuarters {
    return Intl.message(
      'Head Quarters',
      name: 'headQuarters',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message('Branch', name: 'branch', desc: '', args: []);
  }

  /// `Land Document`
  String get landDocument {
    return Intl.message(
      'Land Document',
      name: 'landDocument',
      desc: '',
      args: [],
    );
  }

  /// `Add Land Document`
  String get addLandDocument {
    return Intl.message(
      'Add Land Document',
      name: 'addLandDocument',
      desc: '',
      args: [],
    );
  }

  /// `Own Land Information`
  String get ownLandInformation {
    return Intl.message(
      'Own Land Information',
      name: 'ownLandInformation',
      desc: '',
      args: [],
    );
  }

  /// `Lease Land Information`
  String get leaseLandInformation {
    return Intl.message(
      'Lease Land Information',
      name: 'leaseLandInformation',
      desc: '',
      args: [],
    );
  }

  /// `Mortgage Land Information`
  String get mortgageLandInformation {
    return Intl.message(
      'Mortgage Land Information',
      name: 'mortgageLandInformation',
      desc: '',
      args: [],
    );
  }

  /// `Mouza's name`
  String get mouzaName {
    return Intl.message('Mouza\'s name', name: 'mouzaName', desc: '', args: []);
  }

  /// `Khatian No`
  String get khatianNo {
    return Intl.message('Khatian No', name: 'khatianNo', desc: '', args: []);
  }

  /// `Spot No`
  String get spotNo {
    return Intl.message('Spot No', name: 'spotNo', desc: '', args: []);
  }

  /// `Image of Khatian`
  String get imageOfKhatian {
    return Intl.message(
      'Image of Khatian',
      name: 'imageOfKhatian',
      desc: '',
      args: [],
    );
  }

  /// `Loan Information`
  String get loanInformation {
    return Intl.message(
      'Loan Information',
      name: 'loanInformation',
      desc: '',
      args: [],
    );
  }

  /// `Present Institutional Loan`
  String get presentInstitutionalLoan {
    return Intl.message(
      'Present Institutional Loan',
      name: 'presentInstitutionalLoan',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalLoanAmount {
    return Intl.message('Total', name: 'totalLoanAmount', desc: '', args: []);
  }

  /// `Amount`
  String get paidOffAmount {
    return Intl.message('Amount', name: 'paidOffAmount', desc: '', args: []);
  }

  /// `Loan`
  String get outstandingLoanAmount {
    return Intl.message(
      'Loan',
      name: 'outstandingLoanAmount',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get loanDuration {
    return Intl.message('Duration', name: 'loanDuration', desc: '', args: []);
  }

  /// `Institution`
  String get nameOfInstitution {
    return Intl.message(
      'Institution',
      name: 'nameOfInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reasonForTakeLoan {
    return Intl.message(
      'Reason',
      name: 'reasonForTakeLoan',
      desc: '',
      args: [],
    );
  }

  /// `Yearly Interest Rate`
  String get yearlyInterestRate {
    return Intl.message(
      'Yearly Interest Rate',
      name: 'yearlyInterestRate',
      desc: '',
      args: [],
    );
  }

  /// `Return Delay`
  String get loanReturnDelay {
    return Intl.message(
      'Return Delay',
      name: 'loanReturnDelay',
      desc: '',
      args: [],
    );
  }

  /// `Percentage`
  String get percentage {
    return Intl.message('Percentage', name: 'percentage', desc: '', args: []);
  }

  /// `Month`
  String get month {
    return Intl.message('Month', name: 'month', desc: '', args: []);
  }

  /// `Loan No`
  String get loanNo {
    return Intl.message('Loan No', name: 'loanNo', desc: '', args: []);
  }

  /// `Guarantor's Information`
  String get guarantorInformation {
    return Intl.message(
      'Guarantor\'s Information',
      name: 'guarantorInformation',
      desc: '',
      args: [],
    );
  }

  /// `Guarantors`
  String get guarantors {
    return Intl.message('Guarantors', name: 'guarantors', desc: '', args: []);
  }

  /// `Add Gurantor Info`
  String get addGurantorInfo {
    return Intl.message(
      'Add Gurantor Info',
      name: 'addGurantorInfo',
      desc: '',
      args: [],
    );
  }

  /// `Please Confirm`
  String get pleaseConfirm {
    return Intl.message(
      'Please Confirm',
      name: 'pleaseConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this content?`
  String get areYouSureToDeleteThisContent {
    return Intl.message(
      'Are you sure to delete this content?',
      name: 'areYouSureToDeleteThisContent',
      desc: '',
      args: [],
    );
  }

  /// `Image Gallery`
  String get imageGallery {
    return Intl.message(
      'Image Gallery',
      name: 'imageGallery',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get addImage {
    return Intl.message('Add Image', name: 'addImage', desc: '', args: []);
  }

  /// `Add Farmer's Picture`
  String get addFarmersPicture {
    return Intl.message(
      'Add Farmer\'s Picture',
      name: 'addFarmersPicture',
      desc: '',
      args: [],
    );
  }

  /// `Loan form no`
  String get loanFormNo {
    return Intl.message('Loan form no', name: 'loanFormNo', desc: '', args: []);
  }

  /// `Add Guarantor`
  String get addGuarantroInfo {
    return Intl.message(
      'Add Guarantor',
      name: 'addGuarantroInfo',
      desc: '',
      args: [],
    );
  }

  /// `Assign Guarantor`
  String get assignGuarantro {
    return Intl.message(
      'Assign Guarantor',
      name: 'assignGuarantro',
      desc: '',
      args: [],
    );
  }

  /// `Tag your guarantor`
  String get tagYourGuarantro {
    return Intl.message(
      'Tag your guarantor',
      name: 'tagYourGuarantro',
      desc: '',
      args: [],
    );
  }

  /// `Select relation`
  String get selectRelation {
    return Intl.message(
      'Select relation',
      name: 'selectRelation',
      desc: '',
      args: [],
    );
  }

  /// `This guarantor already exists for this farmer.`
  String get thisGuarantroAlreadyEexistForThisFarmer {
    return Intl.message(
      'This guarantor already exists for this farmer.',
      name: 'thisGuarantroAlreadyEexistForThisFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Please fill up all required field`
  String get pleaseFillUpAllrequiredData {
    return Intl.message(
      'Please fill up all required field',
      name: 'pleaseFillUpAllrequiredData',
      desc: '',
      args: [],
    );
  }

  /// `Machine Service Request`
  String get machineServiceRequest {
    return Intl.message(
      'Machine Service Request',
      name: 'machineServiceRequest',
      desc: '',
      args: [],
    );
  }

  /// `Machine Type`
  String get machineType {
    return Intl.message(
      'Machine Type',
      name: 'machineType',
      desc: '',
      args: [],
    );
  }

  /// `Area Name`
  String get areaName {
    return Intl.message('Area Name', name: 'areaName', desc: '', args: []);
  }

  // skipped getter for the 'pass/distance' key

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `This request already exists`
  String get thisRequestAlreadyExists {
    return Intl.message(
      'This request already exists',
      name: 'thisRequestAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Mound`
  String get mound {
    return Intl.message('Mound', name: 'mound', desc: '', args: []);
  }

  /// `Ton`
  String get ton {
    return Intl.message('Ton', name: 'ton', desc: '', args: []);
  }

  /// `Pass`
  String get pass {
    return Intl.message('Pass', name: 'pass', desc: '', args: []);
  }

  /// `Machine`
  String get machine {
    return Intl.message('Machine', name: 'machine', desc: '', args: []);
  }

  /// `Input`
  String get input {
    return Intl.message('Input', name: 'input', desc: '', args: []);
  }

  /// `Laber`
  String get laber {
    return Intl.message('Laber', name: 'laber', desc: '', args: []);
  }

  /// `Km`
  String get km {
    return Intl.message('Km', name: 'km', desc: '', args: []);
  }

  /// `Total Labor Cost`
  String get totalLaborCost {
    return Intl.message(
      'Total Labor Cost',
      name: 'totalLaborCost',
      desc: '',
      args: [],
    );
  }

  /// `Preparing bundle`
  String get preparingBundle {
    return Intl.message(
      'Preparing bundle',
      name: 'preparingBundle',
      desc: '',
      args: [],
    );
  }

  /// `Preparing guarantor`
  String get preparingGuarantor {
    return Intl.message(
      'Preparing guarantor',
      name: 'preparingGuarantor',
      desc: '',
      args: [],
    );
  }

  /// `Preparing farmer relation`
  String get preparingFarmerRelation {
    return Intl.message(
      'Preparing farmer relation',
      name: 'preparingFarmerRelation',
      desc: '',
      args: [],
    );
  }

  /// `Preparing image type`
  String get preparingImageType {
    return Intl.message(
      'Preparing image type',
      name: 'preparingImageType',
      desc: '',
      args: [],
    );
  }

  /// `Preparing farming image`
  String get preparingFamingImage {
    return Intl.message(
      'Preparing farming image',
      name: 'preparingFamingImage',
      desc: '',
      args: [],
    );
  }

  /// `Preparing land document`
  String get preparingLandDocument {
    return Intl.message(
      'Preparing land document',
      name: 'preparingLandDocument',
      desc: '',
      args: [],
    );
  }

  /// `This guarantor is assigned to a farmer`
  String get thisGuarantorIsAssignedToAFarmer {
    return Intl.message(
      'This guarantor is assigned to a farmer',
      name: 'thisGuarantorIsAssignedToAFarmer',
      desc: '',
      args: [],
    );
  }

  /// `Select type of asset`
  String get selectTypeOfAssets {
    return Intl.message(
      'Select type of asset',
      name: 'selectTypeOfAssets',
      desc: '',
      args: [],
    );
  }

  /// `Approximate quantity of asset`
  String get apxQtyOfAssets {
    return Intl.message(
      'Approximate quantity of asset',
      name: 'apxQtyOfAssets',
      desc: '',
      args: [],
    );
  }

  /// `Approximate value of asset`
  String get apxValueOfAssets {
    return Intl.message(
      'Approximate value of asset',
      name: 'apxValueOfAssets',
      desc: '',
      args: [],
    );
  }

  /// `Approximate total value of asset`
  String get apxTotalValueOfAssets {
    return Intl.message(
      'Approximate total value of asset',
      name: 'apxTotalValueOfAssets',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message('Comment', name: 'comment', desc: '', args: []);
  }

  /// `Guarantor Image`
  String get guarantoImage {
    return Intl.message(
      'Guarantor Image',
      name: 'guarantoImage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid SFID format`
  String get invalidSfidFormate {
    return Intl.message(
      'Invalid SFID format',
      name: 'invalidSfidFormate',
      desc: '',
      args: [],
    );
  }

  /// `Guarantor Asset Information`
  String get guarantorAssetInformation {
    return Intl.message(
      'Guarantor Asset Information',
      name: 'guarantorAssetInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add Asset Image`
  String get addAssetImage {
    return Intl.message(
      'Add Asset Image',
      name: 'addAssetImage',
      desc: '',
      args: [],
    );
  }

  /// `Asset information`
  String get assetInformation {
    return Intl.message(
      'Asset information',
      name: 'assetInformation',
      desc: '',
      args: [],
    );
  }

  /// `Post Office`
  String get postOffice {
    return Intl.message('Post Office', name: 'postOffice', desc: '', args: []);
  }

  /// `Remaining`
  String get remaining {
    return Intl.message('Remaining', name: 'remaining', desc: '', args: []);
  }

  /// `Relation`
  String get relation {
    return Intl.message('Relation', name: 'relation', desc: '', args: []);
  }

  /// `Guarantor Assets`
  String get guarantorAssets {
    return Intl.message(
      'Guarantor Assets',
      name: 'guarantorAssets',
      desc: '',
      args: [],
    );
  }

  /// `Farmer Loan`
  String get farmersLoan {
    return Intl.message('Farmer Loan', name: 'farmersLoan', desc: '', args: []);
  }

  /// `Farmer Assets`
  String get farmersAssets {
    return Intl.message(
      'Farmer Assets',
      name: 'farmersAssets',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `KYC Information`
  String get kycInformation {
    return Intl.message(
      'KYC Information',
      name: 'kycInformation',
      desc: '',
      args: [],
    );
  }

  /// `Branch Limit`
  String get branchLimit {
    return Intl.message(
      'Branch Limit',
      name: 'branchLimit',
      desc: '',
      args: [],
    );
  }

  /// `Employee ID`
  String get employeeId {
    return Intl.message('Employee ID', name: 'employeeId', desc: '', args: []);
  }

  /// `CPV Completed`
  String get cpvCompleted {
    return Intl.message(
      'CPV Completed',
      name: 'cpvCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Total Project`
  String get totalProject {
    return Intl.message(
      'Total Project',
      name: 'totalProject',
      desc: '',
      args: [],
    );
  }

  /// `Days CPV Statistics`
  String get daysCpvStatistics {
    return Intl.message(
      'Days CPV Statistics',
      name: 'daysCpvStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message('Empty', name: 'empty', desc: '', args: []);
  }

  /// `Please fill up all required field`
  String get pleaseFillUpAllRequiredField {
    return Intl.message(
      'Please fill up all required field',
      name: 'pleaseFillUpAllRequiredField',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Comment saved successfully`
  String get commentSavedSuccessfully {
    return Intl.message(
      'Comment saved successfully',
      name: 'commentSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment here`
  String get writeYourCommentHere {
    return Intl.message(
      'Write your comment here',
      name: 'writeYourCommentHere',
      desc: '',
      args: [],
    );
  }

  /// `Please write comment`
  String get pleaseWriteComment {
    return Intl.message(
      'Please write comment',
      name: 'pleaseWriteComment',
      desc: '',
      args: [],
    );
  }

  /// `Empty comment`
  String get emptyComment {
    return Intl.message(
      'Empty comment',
      name: 'emptyComment',
      desc: '',
      args: [],
    );
  }

  /// `Update comment`
  String get updateComment {
    return Intl.message(
      'Update comment',
      name: 'updateComment',
      desc: '',
      args: [],
    );
  }

  /// `Comment update successfully`
  String get commentUpdateSuccessfully {
    return Intl.message(
      'Comment update successfully',
      name: 'commentUpdateSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Project`
  String get project {
    return Intl.message('Project', name: 'project', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Hold your phone near SFID card`
  String get holdYourPhoneNereSfidCard {
    return Intl.message(
      'Hold your phone near SFID card',
      name: 'holdYourPhoneNereSfidCard',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Add Comment`
  String get addComment {
    return Intl.message('Add Comment', name: 'addComment', desc: '', args: []);
  }

  /// `Search here by name, phone, SFID, NID`
  String get searchHereByNamePhoneSfidNid {
    return Intl.message(
      'Search here by name, phone, SFID, NID',
      name: 'searchHereByNamePhoneSfidNid',
      desc: '',
      args: [],
    );
  }

  /// `Address Information`
  String get addressInformation {
    return Intl.message(
      'Address Information',
      name: 'addressInformation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get contactInformation {
    return Intl.message(
      'Contact Information',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `No project found`
  String get noProjectFound {
    return Intl.message(
      'No project found',
      name: 'noProjectFound',
      desc: '',
      args: [],
    );
  }

  /// `The farmer's information has been verified accurately.`
  String get iHaveReadAndAgreeToTheTermsAndConditions {
    return Intl.message(
      'The farmer\'s information has been verified accurately.',
      name: 'iHaveReadAndAgreeToTheTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `CPV not completed`
  String get cpvNotCompleted {
    return Intl.message(
      'CPV not completed',
      name: 'cpvNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `NFC not enabled`
  String get nfcNotAvailable {
    return Intl.message(
      'NFC not enabled',
      name: 'nfcNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to submit CPV information?`
  String get areYouSureToSubmitCPVInformation {
    return Intl.message(
      'Are you sure to submit CPV information?',
      name: 'areYouSureToSubmitCPVInformation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please check terms and condition`
  String get pleasechecktermsandcondition {
    return Intl.message(
      'Please check terms and condition',
      name: 'pleasechecktermsandcondition',
      desc: '',
      args: [],
    );
  }

  /// `Preparing participant info`
  String get preparingParticipantInfo {
    return Intl.message(
      'Preparing participant info',
      name: 'preparingParticipantInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing project info`
  String get preparingProjectInfo {
    return Intl.message(
      'Preparing project info',
      name: 'preparingProjectInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing farmer loan info`
  String get preparingFarmerLoanInfo {
    return Intl.message(
      'Preparing farmer loan info',
      name: 'preparingFarmerLoanInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing comment info`
  String get preparingCommentInfo {
    return Intl.message(
      'Preparing comment info',
      name: 'preparingCommentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing guarantor asset info`
  String get preparingGuarantorAssetInfo {
    return Intl.message(
      'Preparing guarantor asset info',
      name: 'preparingGuarantorAssetInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing general info info`
  String get preparingGeneralInfoInfo {
    return Intl.message(
      'Preparing general info info',
      name: 'preparingGeneralInfoInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing farming info info`
  String get preparingFarmingInfoInfo {
    return Intl.message(
      'Preparing farming info info',
      name: 'preparingFarmingInfoInfo',
      desc: '',
      args: [],
    );
  }

  /// `CPV in progress`
  String get cpvInProgress {
    return Intl.message(
      'CPV in progress',
      name: 'cpvInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to forward this project to the branch?`
  String get doYouWantToForwordThisProjectToTheBranch {
    return Intl.message(
      'Do you want to forward this project to the branch?',
      name: 'doYouWantToForwordThisProjectToTheBranch',
      desc: '',
      args: [],
    );
  }

  /// `Unable to forward project into the bank. Please complete all farmer cpv.`
  String get unableToForwardProjectintoTheBankPleasecompleteallfarmercpv {
    return Intl.message(
      'Unable to forward project into the bank. Please complete all farmer cpv.',
      name: 'unableToForwardProjectintoTheBankPleasecompleteallfarmercpv',
      desc: '',
      args: [],
    );
  }

  /// `Already, the project was forwarded to the bank.`
  String get alreadyForwarded {
    return Intl.message(
      'Already, the project was forwarded to the bank.',
      name: 'alreadyForwarded',
      desc: '',
      args: [],
    );
  }

  /// `Image View`
  String get imageView {
    return Intl.message('Image View', name: 'imageView', desc: '', args: []);
  }

  /// `CPV complete. If necessary you can comment until the project is forwarded to the branch.`
  String get cpvBanner {
    return Intl.message(
      'CPV complete. If necessary you can comment until the project is forwarded to the branch.',
      name: 'cpvBanner',
      desc: '',
      args: [],
    );
  }

  /// `The project has been successfully forwarded to the branch.`
  String get forwardedSuccessfully {
    return Intl.message(
      'The project has been successfully forwarded to the branch.',
      name: 'forwardedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Proposed loan limit`
  String get proposedLoanLimit {
    return Intl.message(
      'Proposed loan limit',
      name: 'proposedLoanLimit',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternet {
    return Intl.message(
      'No internet connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get pleaseCheckYourInternet {
    return Intl.message(
      'Please check your internet connection',
      name: 'pleaseCheckYourInternet',
      desc: '',
      args: [],
    );
  }

  /// `Farmer National ID`
  String get farmerNationalId {
    return Intl.message(
      'Farmer National ID',
      name: 'farmerNationalId',
      desc: '',
      args: [],
    );
  }

  /// `Referance Image`
  String get referanceImage {
    return Intl.message(
      'Referance Image',
      name: 'referanceImage',
      desc: '',
      args: [],
    );
  }

  /// `Forward the proposed amount.`
  String get forwardTheProposedAmount {
    return Intl.message(
      'Forward the proposed amount.',
      name: 'forwardTheProposedAmount',
      desc: '',
      args: [],
    );
  }

  /// `The proposed loan can not be advised.`
  String get theProposedLoanCanNotbeadvised {
    return Intl.message(
      'The proposed loan can not be advised.',
      name: 'theProposedLoanCanNotbeadvised',
      desc: '',
      args: [],
    );
  }

  /// `The proposed loan amounts need to be reviewed.`
  String get theProposedloanamountsneedtobereviewed {
    return Intl.message(
      'The proposed loan amounts need to be reviewed.',
      name: 'theProposedloanamountsneedtobereviewed',
      desc: '',
      args: [],
    );
  }

  /// `Select summary`
  String get selectSummary {
    return Intl.message(
      'Select summary',
      name: 'selectSummary',
      desc: '',
      args: [],
    );
  }

  /// `Total Applicant`
  String get totalApplicant {
    return Intl.message(
      'Total Applicant',
      name: 'totalApplicant',
      desc: '',
      args: [],
    );
  }

  /// `Total Land`
  String get totalLand {
    return Intl.message('Total Land', name: 'totalLand', desc: '', args: []);
  }

  /// `Proposed Amount`
  String get proposedAmount {
    return Intl.message(
      'Proposed Amount',
      name: 'proposedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Farming Year`
  String get farmingYear {
    return Intl.message(
      'Farming Year',
      name: 'farmingYear',
      desc: '',
      args: [],
    );
  }

  /// `Total Pending`
  String get totalPending {
    return Intl.message(
      'Total Pending',
      name: 'totalPending',
      desc: '',
      args: [],
    );
  }

  /// `Close to completion`
  String get closeToCompletion {
    return Intl.message(
      'Close to completion',
      name: 'closeToCompletion',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// ``
  String get ti {
    return Intl.message('', name: 'ti', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message('Rate Us', name: 'rateUs', desc: '', args: []);
  }

  /// `Select Your Language`
  String get selectYourLanguage {
    return Intl.message(
      'Select Your Language',
      name: 'selectYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Save account`
  String get saveAccount {
    return Intl.message(
      'Save account',
      name: 'saveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Need help?`
  String get needHelp {
    return Intl.message('Need help?', name: 'needHelp', desc: '', args: []);
  }

  /// `Securely access your account`
  String get securerlyAccessYourAccount {
    return Intl.message(
      'Securely access your account',
      name: 'securerlyAccessYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sync project?`
  String get doYouWantToSyncProject {
    return Intl.message(
      'Do you want to sync project?',
      name: 'doYouWantToSyncProject',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Not Completed`
  String get notCompleted {
    return Intl.message(
      'Not Completed',
      name: 'notCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Filter farmer by CPV status`
  String get filterFarmerByCpvStatus {
    return Intl.message(
      'Filter farmer by CPV status',
      name: 'filterFarmerByCpvStatus',
      desc: '',
      args: [],
    );
  }

  /// `Login by fingerprint`
  String get loginByFringerPrint {
    return Intl.message(
      'Login by fingerprint',
      name: 'loginByFringerPrint',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to close the app?`
  String get doYouWantToCloseTheApp {
    return Intl.message(
      'Do you want to close the app?',
      name: 'doYouWantToCloseTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Save mobile number`
  String get saveMobileNumber {
    return Intl.message(
      'Save mobile number',
      name: 'saveMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable biometric?`
  String get doYouWantToEnableBioMetric {
    return Intl.message(
      'Do you want to enable biometric?',
      name: 'doYouWantToEnableBioMetric',
      desc: '',
      args: [],
    );
  }

  /// `Biometric`
  String get biometric {
    return Intl.message('Biometric', name: 'biometric', desc: '', args: []);
  }

  /// `Biometric enable successfully`
  String get biometricEnableSuccessfully {
    return Intl.message(
      'Biometric enable successfully',
      name: 'biometricEnableSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Biometric disable successfully`
  String get biometricDisableSuccessfully {
    return Intl.message(
      'Biometric disable successfully',
      name: 'biometricDisableSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to disable biometric?`
  String get doYouWantToDisableBioMetric {
    return Intl.message(
      'Do you want to disable biometric?',
      name: 'doYouWantToDisableBioMetric',
      desc: '',
      args: [],
    );
  }

  /// `Biometric not available`
  String get biometricNotAvailable {
    return Intl.message(
      'Biometric not available',
      name: 'biometricNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message('Finance', name: 'finance', desc: '', args: []);
  }

  /// `Quick Access`
  String get quickAccess {
    return Intl.message(
      'Quick Access',
      name: 'quickAccess',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Select Devision`
  String get selectDevision {
    return Intl.message(
      'Select Devision',
      name: 'selectDevision',
      desc: '',
      args: [],
    );
  }

  /// `Select District`
  String get selectDistrict {
    return Intl.message(
      'Select District',
      name: 'selectDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Select Upazila`
  String get selectUpazila {
    return Intl.message(
      'Select Upazila',
      name: 'selectUpazila',
      desc: '',
      args: [],
    );
  }

  /// `Select Union`
  String get selectUnion {
    return Intl.message(
      'Select Union',
      name: 'selectUnion',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirm password`
  String get enterYourConfirmPassword {
    return Intl.message(
      'Enter your confirm password',
      name: 'enterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Land Amount`
  String get landAmount {
    return Intl.message('Land Amount', name: 'landAmount', desc: '', args: []);
  }

  /// `Request Type`
  String get requestType {
    return Intl.message(
      'Request Type',
      name: 'requestType',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Approved`
  String get approved {
    return Intl.message('Approved', name: 'approved', desc: '', args: []);
  }

  /// `Avg. Expected Yield (Kg/Dec)`
  String get averageExpectedYieldKgPerDecimal {
    return Intl.message(
      'Avg. Expected Yield (Kg/Dec)',
      name: 'averageExpectedYieldKgPerDecimal',
      desc: '',
      args: [],
    );
  }

  /// `Market Price (Tk/Gram)`
  String get marketPriceTkPerGram {
    return Intl.message(
      'Market Price (Tk/Gram)',
      name: 'marketPriceTkPerGram',
      desc: '',
      args: [],
    );
  }

  /// `Seed Rate/Dec`
  String get seedRatePerDecimal {
    return Intl.message(
      'Seed Rate/Dec',
      name: 'seedRatePerDecimal',
      desc: '',
      args: [],
    );
  }

  /// `Amount of water`
  String get amountOfWater {
    return Intl.message(
      'Amount of water',
      name: 'amountOfWater',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message('Priority', name: 'priority', desc: '', args: []);
  }

  /// `Highland`
  String get highland {
    return Intl.message('Highland', name: 'highland', desc: '', args: []);
  }

  /// `Medium highland`
  String get mediumHighland {
    return Intl.message(
      'Medium highland',
      name: 'mediumHighland',
      desc: '',
      args: [],
    );
  }

  /// `Medium lowland`
  String get mediumLowland {
    return Intl.message(
      'Medium lowland',
      name: 'mediumLowland',
      desc: '',
      args: [],
    );
  }

  /// `Lowland`
  String get lowland {
    return Intl.message('Lowland', name: 'lowland', desc: '', args: []);
  }

  /// `Sandy Soil`
  String get sandySoil {
    return Intl.message('Sandy Soil', name: 'sandySoil', desc: '', args: []);
  }

  /// `Silt Soil`
  String get siltSoil {
    return Intl.message('Silt Soil', name: 'siltSoil', desc: '', args: []);
  }

  /// `Clay Soil`
  String get claySoil {
    return Intl.message('Clay Soil', name: 'claySoil', desc: '', args: []);
  }

  /// `Loamy Soil`
  String get loamySoil {
    return Intl.message('Loamy Soil', name: 'loamySoil', desc: '', args: []);
  }

  /// `A new password has been sent to your mobile number`
  String get newPasswordSent {
    return Intl.message(
      'A new password has been sent to your mobile number',
      name: 'newPasswordSent',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Advisory`
  String get advisory {
    return Intl.message('Advisory', name: 'advisory', desc: '', args: []);
  }

  /// `Weather Advisory`
  String get weatherAdvisory {
    return Intl.message(
      'Weather Advisory',
      name: 'weatherAdvisory',
      desc: '',
      args: [],
    );
  }

  /// `Soil Testing`
  String get soilTesting {
    return Intl.message(
      'Soil Testing',
      name: 'soilTesting',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
