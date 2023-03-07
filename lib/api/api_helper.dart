import '../models/api_response.dart';

mixin ApiHelper {
  ApiResponse get failedResponse => const ApiResponse(
        message: 'Something went wrong ?! Please try again.',
        success: false,
      );
}
