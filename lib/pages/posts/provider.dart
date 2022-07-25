import 'package:urgent/common/entity/Post.dart';
import 'package:urgent/common/library/api_request.dart';

class PostsProvider {
  void getPostsList({
    Function()? beforeSend,
    required Function(List<Post> posts) onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: 'https://jsonplaceholder.typicode.com/posts',data: null).get(
      beforeSend: () => {if(beforeSend != null) beforeSend()},
      onSuccess: (data) {
        print(data);
        var postsJson = data as List;
        List<Post> posts = postsJson.map((postJson) => Post.fromJson(postJson)).toList();
        onSuccess(posts);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
