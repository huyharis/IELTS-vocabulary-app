class Topic{
  late String title;
  late String imgUrl;

  Topic.fromMap(Map<String, dynamic> map){
    title = map["title"];
    imgUrl = map["image"];
  }

  Map<String ,dynamic> toMap(){
    return {
      'title': title,
      'image': imgUrl,
    };
  }
}