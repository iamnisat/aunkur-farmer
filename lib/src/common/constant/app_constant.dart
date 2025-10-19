class AppConstant {
  static const String appName = 'Aunkur Farmer';
  static const String APP_VERSION = '1.0.0';

  // Shared Preferences Keys
  static const String keyCurrentToken = 'CURRENT_TOKEN';
  static const String ISOPEN = 'isopen';
  static const String KHOTIYAN = 'khotiyan';
  static const String GUARANTOR = 'guarantor';
  static const String FARMING_IMAGE = 'farming-images';
  static const String GUARANTOR_NID = 'guarantor-nid';
  static const String PARTNERS = 'partners';
  static const String COMMENTS = 'comments/';

  // Share Key for SharedPreferences
  static const String isLogin = 'isLogin';
  static const String user = 'user';
  static const String TOKEN = 'token';
  static const String theme = 'theme';
  static const String language = 'language';
  static const String isDarkMode = 'isDarkMode';
  static const String isOpen = 'isOpen';
  static const String EMAIL = 'email';
  static const String PHONE = 'phone';
  static const String PASSWORD = 'password';
  static const String REMEMBERME = 'rememberMe';
  static const String USER_ID = 'user_id';
  static const String PRIVACY_POLICY_URL = "https://aunkur.ai/privacy-policy";
  static const String USER_NAME = 'user_name';


    static const String BUCKER_BASE_URL = 'https://storage.googleapis.com/aunkur';

  // S3 bucket Folder Name
  static const String S3_BUCKET_FOLDER_COMPLAIN = 'partner-complain';
  static const String GLOBAL_PRODUCTS = '$BUCKER_BASE_URL/global-products/';
  static const String S3_BUCKET_FOLDER_CHEMICALMANAGEMENT = '$BUCKER_BASE_URL/chemical-management/';
  static const String S3_BUCKET_FOLDER_CROP = '$BUCKER_BASE_URL/crops/';
  static const String S_3_BUCKET_FOLDER_PESTICIDES = '$BUCKER_BASE_URL/pesticides/';
  static const String S_3_BUCKET_FOLDER_USER = '$BUCKER_BASE_URL/users/';
  static const String S_3_BUCKET_FOLDER_DISEASEIDENTIFICATION = '$BUCKER_BASE_URL/diseaseIdentification/';
}
