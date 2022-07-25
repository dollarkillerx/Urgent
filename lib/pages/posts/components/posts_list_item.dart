import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../common/entity/Post.dart';

class PostsListItem extends StatelessWidget {
  final Post post;

  const PostsListItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.post == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 20, right: 20, bottom: 15, left: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  "https://picsum.photos/50/50?random=${post.id}",
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 5,),
                    Text("2 days ago",style: TextStyle(fontSize: 12,color: Colors.black38),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(post.body!,style: TextStyle(color: Colors.black87),),
          Row(
            children: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.redAccent,)),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark,color: Colors.yellowAccent,)),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.hand_thumbsup,color: Colors.blueAccent,)),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.hand_thumbsdown,color: Colors.black54,)),
            ],

          )
        ],
      ),
    );
  }
}
