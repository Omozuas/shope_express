import 'package:flutter/material.dart';

class ProductProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<SigupResopnsModel> createUser(
    String firstname,
    String lastname,
    String email,
    String mobile,
    String password,
  ) async {
    setLoading(true);

    var registerUser = "${ApiUrl.baseUrl}signup";
    var res = await http.post(Uri.parse(registerUser),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "mobile": mobile,
          "password": password
        }));

    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return sigupResopnsModel(res.body);
  }
}
