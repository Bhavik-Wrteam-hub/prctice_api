import 'package:practice_api/utils/api.dart';

class Authrepo {
  static Future<Map<String, dynamic>> loginrepo({
    required String grnumber,
    required String password,
  }) async {
    try {
      const fcmToken =
          'eEEGvR3ZS_6a38DhDU-rvC:APA91bGAeSJqKkyG0x4HwyBt8iXnIXwttRIQfDIFAXZceUehIIxQjWQAe0aQpz62x3plwO-uVlcFATjKDAG2lNjgrwDFGQy4zrl_fo6u2NcH4z-MFyz8HGpM-k9hTNY_rweEFLF4gJlV';
      Map<String, dynamic> body = {
        "password": password,
        "gr_number": grnumber,
        "fcm_id": fcmToken
      };

      final result = await ApiCall().postapi(
        url: ApiCall.loginurl,
        body: body,
        useAuthtoken: false,
      );
      print("this is result Screen");
      print(result);
      return result;
      //return result['data'];
    } catch (e) {
      ApiException(e.toString());
    }
    return {};
  }
}
