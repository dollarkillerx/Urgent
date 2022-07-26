import 'package:get/get.dart';
import 'package:urgent/pages/posts/provider.dart';
import '../../common/entity/Post.dart';

class PostsController extends GetxController {
  List<Post> postsList = [];
  bool isLoading = true;

  @override
  void onInit() {
    PostsProvider().getPostsList(beforeSend: () {
      print("PostsProvider beforeSend");
    }, onSuccess: (posts) {
      this.isLoading = false;
      postsList.addAll(posts);
    }, onError: (error) {
      this.isLoading = false;
      print(error);
      print('PostsProvider error');
    });
    super.onInit();
  }
}
