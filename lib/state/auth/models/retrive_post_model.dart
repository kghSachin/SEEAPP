import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RetrivePostModel {
  int id;
  String title;
  String description;
  String createdAt;
  String updatedAt;
  RetrivePostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  RetrivePostModel copyWith({
    int? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return RetrivePostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory RetrivePostModel.fromMap(Map<String, dynamic> map) {
    return RetrivePostModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RetrivePostModel.fromJson(String source) =>
      RetrivePostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RetrivePostModel(id: $id, title: $title, description: $description, created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  bool operator ==(covariant RetrivePostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
