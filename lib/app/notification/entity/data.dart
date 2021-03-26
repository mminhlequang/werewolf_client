class Data {
  String typeId;
  String body;
  String type;
  String title;

  Data(this.typeId, this.body, this.type, this.title);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        json['type_id'] as String,
        json['body'] as String,
        json['type'] as String,
        json['title'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type_id': this.typeId,
        'body': this.body,
        'type': this.type,
        'title': this.title,
      };

  @override
  String toString() {
    return '''{"type_id": "${this.typeId}", "body": "${this.body}", "type": "${this.type}", "title": "${this.title}"}''';
  }
}
