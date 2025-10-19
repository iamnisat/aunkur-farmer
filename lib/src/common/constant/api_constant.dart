class ApiConstant {
  // API Related Stuff
  //TODO: Add your base URL here
  static const String BASEURL = '';

  //=========USER AUTH RELATED API ENDPOINTS=========
  static const String LOGIN = 'v1/farmers/login';
  static const String REGISTER = 'v1/farmers/signup';
  static const String FORGOT_PASSWORD = 'v1/farmers/forgot-password';
  static const String RESET_PASSWORD = 'reset-password';
  static const String CHANGE_PASSWORD = 'v1/farmers/change-password';
  static const String PROFILE = 'v1/farmers/profile';
  static const String UPDATE_PROFILE = 'update-profile';
  static const String LOGOUT = 'logout';

  //========ADDRESS API ENDPOINTS========
  static const String DIVISIONS = 'v1/address/divisions';
  static const String DISTRICTS = 'v1/address/districts';
  static const String UPAZILAS = 'v1/address/upazillas';
  static const String UNIONS = 'v1/address/unions';

  //========CROP RELATED API ENDPOINTS========
  static const String CROPS = 'v1/crops';
  static const String CROP_DETAILS = 'v1/crops/'; //{id}
  static const String PESTICIDE = 'pest-and-diseases';
  static const String HERBICIDE = 'herbicides';
  static const String VARIETIES = 'varieties'; //{id}/varieties

  //========CHAT MODULE API ENDPOINTS========
  static const String CONVERSATIONS = 'v1/messages/conversations';
  static const String MESSAGES = 'v1/messages'; //{id}/messages

  //========ADVISORY RELATED API ENDPOINTS======
  static const String CREATE_ADVISORY = 'v1/messages/advisory';
}
