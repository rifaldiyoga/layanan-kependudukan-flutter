import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class ArticleRepository {
  final ApiClient apiClient;

  ArticleRepository({required this.apiClient});

  Future<Response> getLatestArticle() async {
    print('token ' + apiClient.token);
    return await apiClient.getData(AppConstants.ARTICLE_URL);
  }
}
