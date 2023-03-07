class ApiSettings {
  static const _baseUrl = 'http://tcbike.bulbul-app.com/api/v1';
  static const signIn = '$_baseUrl/user/login';
  static const signUp = '$_baseUrl/user/register';
  static const verify = '$_baseUrl/user/verify';
  static const resendCode = '$_baseUrl/user/resendCode';
  static const resetPassword = '$_baseUrl/user/passwordReset';

  // static final header = {
  //   'Accept': 'application/json',
  //   '/userorization': SharedPrefController().token,
  //   'lang': userLocale,
  // };
  // static final token = SharedPrefController().token;
}
