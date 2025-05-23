import 'package:quiz_app_2/const/const.dart';
import 'package:quiz_app_2/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future <CategoryModel?> get ()async{
    var response = await http.get(Uri.parse('${Const.BaseUrl}/api_category.php'));
if (response.statusCode == 200){
  return CategoryModel.fromJson(response.body);
} else {
  return null;
}
  }
}