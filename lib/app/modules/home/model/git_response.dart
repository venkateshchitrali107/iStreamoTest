class GitResponse {
  int? id;
  String? nodeId;
  String? name;
  String? description;
  String? language;
  int? openIssues;
  int? watchers;

  GitResponse(
      {this.id,
      this.nodeId,
      this.name,
      this.description,
      this.language,
      this.openIssues,
      this.watchers});

  GitResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    description = json['description'];
    language = json['language'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['language'] = this.language;
    data['open_issues'] = this.openIssues;
    data['watchers'] = this.watchers;
    return data;
  }
}
