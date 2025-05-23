import 'package:quiz_app_2/const/const.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_2/model/quiz_response_model.dart';

class QuizRepository {
  Future<QuizResponseModel?> get(
    int count,
    String? difficulty,
    int? category,
  ) async {
    Map <String, String> param = {};
    param ['amount'] = '$count';
    if (difficulty != null) {
      param ['difficulty'] = difficulty;
    }
    if (category != null) {
      param ['category'] = '$category';
    }
    var response = await http.get(Uri.parse('${Const.BaseUrl}/api.php').replace(queryParameters: param));
    if (response.statusCode == 200) {
      return QuizResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
