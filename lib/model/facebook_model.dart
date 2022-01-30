class FaceBookModel
{
  final String? name ;
  final String? email;
  final String? id ;
  final FaceBookPicUser? faceBookPicUser;

  FaceBookModel({
    this.name,
    this.email,
    this.id,
    this.faceBookPicUser,
});

  factory FaceBookModel.fromJson(Map<String , dynamic>json) => FaceBookModel
    (
      name:json['name'],
      email:json['email'],
      id:json['id'],
      faceBookPicUser:FaceBookPicUser.fromJson(json['picture']['data']),
  );

}

class FaceBookPicUser
{
  final String? url ;
  final int? height;
  final int? width ;

  FaceBookPicUser({
    this.url,
    this.height,
    this.width,
});

  factory FaceBookPicUser.fromJson(Map<String , dynamic>json) => FaceBookPicUser
    (
      url:json['url'],
      height:json['height'],
      width:json['width'],
  );

}