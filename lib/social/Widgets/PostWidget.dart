// import 'dart:async';
// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:relaxify/User/login.dart';
// import 'package:relaxify/User/user.dart';
// import 'package:relaxify/social/Posts.dart';
// import 'package:relaxify/social/post.dart';
// import 'package:relaxify/social/postImage.dart';
// import 'package:relaxify/social/Widgets/CImageWidget.dart';

// class Post extends StatefulWidget {
//   final String postId;
//   final String email;
//   final String caption;
//   final String image;
//   final String uploadTime;
//   final dynamic likes;
//   final String url;

//   final String username;

//   Post({
//     this.postId,
//     this.email,
//     this.caption,
//     this.image,
//     this.uploadTime,
//     this.likes,
//     this.url,
//     this.username,
//   });

//   factory Post.fromDocument(DocumentSnapshot documentSnapshot) {
//     return Post(
//       postId: documentSnapshot["postId"],
//       email: documentSnapshot["email"],
//       caption: documentSnapshot["caption"],
//       image: documentSnapshot["image"],
//       uploadTime: documentSnapshot["uploadTime"],
//       likes: documentSnapshot["likes"],
//       url: documentSnapshot["url"],
//       username: documentSnapshot["username"],
//     );
//   }

//   int getTotalNumberOfLikes(likes) {
//     if (likes == null) {
//       return 0;
//     }
//     int counter = 0;
//     likes.values.forEach((eachValue) {
//       if (eachValue == true) {
//         counter = counter + 1;
//       }
//     });
//     return counter;
//   }

//   @override
//   _PostState createState() => _PostState(
//         postId: this.postId,
//         email: this.email,
//         caption: this.caption,
//         image: this.image,
//         uploadTime: this.uploadTime,
//         likes: this.likes,
//         url: this.url,
//         likeCount: getTotalNumberOfLikes(this.likes),
//         username: this.username,
//       );
// }

// class _PostState extends State<Post> {
//   final String postId;
//   final String email;
//   final String caption;
//   final String image;
//   final String uploadTime;
//   final String username;
//   Map likes;
//   final String url;
//   int likeCount;
//   bool isLiked;
//   bool showHeart = false;
//   final String currentOnlineUserId = currentUser?.uid;

//   _PostState(
//       {this.postId,
//       this.email,
//       this.caption,
//       this.image,
//       this.uploadTime,
//       this.likes,
//       this.url,
//       this.likeCount,
//       this.isLiked,
//       this.username});
//   @override
//   Widget build(BuildContext context) {
//     isLiked = (likes[currentOnlineUserId] == true);
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           createPostHead(),
//           createPostPicture(),
//           createPostFooter(),
//         ],
//       ),
//     );
//   }

//   createPostHead() {
//     return FutureBuilder<DocumentSnapshot>(
//       future: userReference.doc(email).get(),
//       builder: (context, dataSnapshot) {
//         if (!dataSnapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         User user = User.fromDocument(dataSnapshot.data);
//         bool isPostOwner = currentOnlineUserId == email;
//         return ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.grey,
//             ),
//             title: GestureDetector(
//               onTap: () => print("Show Profile"),
//               child: Text(
//                 user.username,
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//             subtitle: Text(
//               uploadTime,
//               style: TextStyle(color: Colors.white),
//             ),
//             trailing: isPostOwner
//                 ? IconButton(
//                     icon: Icon(
//                       Icons.more_vert,
//                       color: Colors.white,
//                     ),
//                     onPressed: () => print("Deleted"),
//                   )
//                 : Text("data"));
//       },
//     );
//   }

//   removeLike() {
//     bool isNotPostOwner = currentOnlineUserId != email;

//     if (isNotPostOwner) {
//       activityFeedReference
//           .doc(email)
//           .collection("feedItems")
//           .doc(postId)
//           .get()
//           .then((document) {
//         if (document.exists) {
//           document.reference.delete();
//         }
//       });
//     }
//   }

//   addLike() {
//     bool isNotPostOwner = currentOnlineUserId != email;
//     if (isNotPostOwner) {
//       activityFeedReference.doc(email).collection("feedItems").doc(postId).set({
//         "type": likes,
//         "username": currentUser.displayName,
//         "userId": currentUser.uid,
//         "timeStamp": uploadTime,
//         "url": url,
//         "postId": postId,
//         "userProfileImage": currentUser.photoURL,
//       });
//     }
//   }

//   controlUserLikePost() {
//     bool _liked = likes[currentOnlineUserId] == true;

//     if (_liked) {
//       postsRef
//           .doc(email)
//           .collection("userPosts")
//           .doc(postId)
//           .update({"likes.$currentOnlineUserId": false});
//       removeLike();
//       setState(() {
//         likeCount = likeCount - 1;
//         isLiked = false;
//         likes[currentOnlineUserId] = false;
//       });
//     } else if (!_liked) {
//       postsRef
//           .doc(email)
//           .collection("userPosts")
//           .doc(postId)
//           .update({"likes.$currentOnlineUserId": false});
//       removeLike();
//       setState(() {
//         likeCount = likeCount - 1;
//         isLiked = false;
//         likes[currentOnlineUserId] = true;

//         addLike();

//         setState(() {
//           likeCount = likeCount + 1;
//           isLiked = true;
//           likes[currentOnlineUserId] = true;
//           showHeart = true;
//         });
//         Timer(Duration(milliseconds: 800), () {
//           setState(() {
//             showHeart = false;
//           });
//         });
//       });
//     }
//   }

//   createPostPicture() {
//     return GestureDetector(
//       onDoubleTap: () => print("Post Liked"),
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           // cachedNetworkImage(url),
//           Image.network(url),
//           showHeart
//               ? Icon(
//                   Icons.favorite,
//                   size: 140.0,
//                   color: Colors.pink,
//                 )
//               : Text(""),
//         ],
//       ),
//     );
//   }

//   createPostFooter() {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
//             GestureDetector(
//               onTap: () => controlUserLikePost(),
//               child: Icon(
//                 isLiked ? Icons.favorite : Icons.favorite_border,
//                 size: 28.0,
//                 color: Colors.pink,
//               ),
//             ),
//             Padding(padding: EdgeInsets.only(right: 28.0)),
//             GestureDetector(
//               onTap: () => print("show comments"),
//               child: Icon(
//                 Icons.chat_bubble_outline,
//                 size: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(left: 20.0),
//               child: Text(
//                 "$likeCount likes",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(left: 20.0),
//               child: Text(
//                 "$username  ",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 caption,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// //17-12-20
// // String uid;
// // bool isLiked = false;
// // int count = 0;
// // DocumentReference likesRef;
// // CollectionReference postRef;
// // Map<String, dynamic> data;
// // DocumentSnapshot ds;
// // @override
// // void initState() {
// //   likesRef =
// //       FirebaseFirestore.instance.collection('likes').doc(user.displayName);

// //   super.initState();
// //   // likesRef.get().then((value) => data = value.data);
// //   likesRef.get().then((value) => value.data);
// //   postRef = FirebaseFirestore.instance.collection('posts');
// // }

// //Ended
