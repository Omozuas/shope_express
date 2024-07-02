class PostedBy {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? password;
  String? role;
  bool? isBlocked;
  bool? isLogin;
  List<dynamic>? cart;
  List<dynamic>? whislist;
  String? refreshToken;
  String? profileImg;

  PostedBy({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.mobile,
    this.password,
    this.role,
    this.isBlocked,
    this.isLogin,
    this.cart,
    this.whislist,
    this.refreshToken,
    this.profileImg,
  });

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        role: json["role"],
        isBlocked: json["isBlocked"],
        isLogin: json["isLogin"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        whislist: List<dynamic>.from(json["whislist"].map((x) => x)),
        refreshToken: json["refreshToken"],
        profileImg: json["profileImg"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "password": password,
        "role": role,
        "isBlocked": isBlocked,
        "isLogin": isLogin,
        "cart": List<dynamic>.from(cart!.map((x) => x)),
        "whislist": List<dynamic>.from(whislist!.map((x) => x)),
        "refreshToken": refreshToken,
        "profileImg": profileImg,
      };
}
