

class UserAccount{

  String gender;
  String name;
  String location;
  int id;
  String avatar;
  String email;
  String url;

  UserAccount({this.gender,
        this.name,
        this.location,
        this.id,
        this.avatar,
        this.email,
        this.url});

  @override
  String toString() {
    return 'UserAccount{gender: $gender, name: $name, location: $location, id: $id, avatar: $avatar, email: $email, url: $url}';
  }
}


class UserInfo{
  int uid;
  String name;
  int gender;
  String province;
  String city;
  List<dynamic> platforms;
  List<dynamic> expertise;
  String joinTime;
  String lastLoginTime;
  String portrait;
  int fansCount;
  int favoriteCount;
  int followersCount;
  Map<String, dynamic> notice;

  UserInfo({this.uid,
        this.name,
        this.gender,
        this.province,
        this.city,
        this.platforms,
        this.expertise,
        this.joinTime,
        this.lastLoginTime,
        this.portrait,
        this.fansCount,
        this.favoriteCount,
        this.followersCount,
        this.notice});

  @override
  String toString() {
    return 'UserInfo{uid: $uid, name: $name, gender: $gender, province: $province, city: $city, platforms: $platforms, expertise: $expertise, joinTime: $joinTime, lastLoginTime: $lastLoginTime, portrait: $portrait, fansCount: $fansCount, favoriteCount: $favoriteCount, followersCount: $followersCount, notice: $notice}';
  }


}