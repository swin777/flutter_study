import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post.fromJson(json)
      : this.userId = json['userId'],
        this.id = json['id'],
        this.title = json['title'],
        this.body = json['body'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  Comment.fromJson(json)
      : this.postId = json['postId'],
        this.id = json['id'],
        this.name = json['name'],
        this.email = json['email'],
        this.body = json['body'];

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  Todo.fromJson(json)
      : this.userId = json['userId'],
        this.id = json['id'],
        this.title = json['title'],
        this.completed = json['completed'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}

class JsonPlaceholder with ChangeNotifier {
  List<Post> _posts = [];
  List<Comment> _comments = [];
  List<Todo> _todos = [];

  List<Post> get posts => _posts;
  List<Comment> get comments => _comments;
  List<Todo> get todos => _todos;

  Future<void> getPosts() async {
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/posts');
      final postData = json.decode(response.body);

      postData.forEach((post) {
        _posts.add(Post.fromJson(post));
      });

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getComments() async {
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/comments');
      final commentData = json.decode(response.body);

      commentData.forEach((comment) {
        _comments.add(Comment.fromJson(comment));
      });

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getTodos() async {
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/todos');
      final todoData = json.decode(response.body);

      todoData.forEach((todo) {
        _todos.add(Todo.fromJson(todo));
      });

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
