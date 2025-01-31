import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ReposModel {
  final String name;
  final String description;
  final String language;
  final int totalCommits;
  final int stargazersCount;
  ReposModel({
    required this.name,
    required this.description,
    required this.language,
    required this.totalCommits,
    required this.stargazersCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'language': language,
      'totalCommits': totalCommits,
      'stargazers_count': stargazersCount,
    };
  }

  factory ReposModel.fromMap(Map<String, dynamic> map) {
    return ReposModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      language: map['language'] ?? '',
      totalCommits: map['totalCommits'] ?? 0,
      stargazersCount: map['stargazers_count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposModel.fromJson(String source) => ReposModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReposModel(name: $name, description: $description, language: $language, totalCommits: $totalCommits, stargazersCount: $stargazersCount)';
  }

  ReposModel copyWith({
    String? name,
    String? description,
    String? language,
    int? totalCommits,
    int? stargazersCount,
  }) {
    return ReposModel(
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
      totalCommits: totalCommits ?? this.totalCommits,
      stargazersCount: stargazersCount ?? this.stargazersCount,
    );
  }
}
