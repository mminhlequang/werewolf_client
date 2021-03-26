class Notification {
  String title;
  String body;

  Notification(
    this.title,
    this.body,
  );

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        json['title'] as String,
        json['body'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': this.title,
        'body': this.body,
      };

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}
