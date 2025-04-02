import 'package:quiz_app_2/const/const.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_2/model/quiz_response_model.dart';

class QuizRepository {
  Future<QuizResponseModel?> get(
    int count,
    String? difficulty,
    int? category,
  ) async {
    var response = await http.get(Uri.parse('${Const.BaseUrl}/api.php'));
    if (response.statusCode == 200) {
      return QuizResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
