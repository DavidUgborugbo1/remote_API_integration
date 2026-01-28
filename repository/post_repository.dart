import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:remote_demo/model/post.dart';
import 'package:http/http.dart' as http;
class PostRepository {
  final String baseurl = "https://jsonplaceholder.typicode.com";

  //fetching our posts//
  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse('$baseurl/posts'));

    if (response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      debugPrint(response.body);
      return body.map((dynamic item) => Post.fromJson(item)).toList();
    } else{
      throw Exception("Failed to Load posts");
    }
  }

  Future<Post> createPost(Post post) async{
    
  }
}