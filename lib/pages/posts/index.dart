import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/components/loading_overlay.dart';
import 'package:urgent/pages/posts/components/posts_list_item.dart';
import 'controller.dart';

class PostsPage extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<PostsController>(
          builder: (controller) {
            return LoadingOverlay(
                isLoading: controller.isLoading,
                child: Center(
                  child: ListView.builder(
                    itemCount: controller.postsList.length,
                    itemBuilder: (context, index) => PostsListItem(
                      post: controller.postsList[index],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
