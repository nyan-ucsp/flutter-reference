// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:easy_localization/easy_localization.dart';

// class CropImageScreen extends StatefulWidget {
//   final Uint8List uin8ListImageData;
//   static const String routeName = 'crop_image_screen';

//   const CropImageScreen({Key? key, required this.uin8ListImageData})
//       : super(key: key);
//   @override
//   _CropImageScreenState createState() => _CropImageScreenState();
// }

// class _CropImageScreenState extends State<CropImageScreen>
//     with RestorationMixin {
//   final _cropController = CropController();

//   late bool _loadingImage = false;
//   set currentImage(int value) {
//     _cropController.image = widget.uin8ListImageData;
//   }

//   late RestorableBool _isSumbnail;
//   late RestorableBool _isCropping;
//   late RestorableBool _isCircleUi;
//   Uint8List? _croppedData;

//   @override
//   void initState() {
//     _isSumbnail = RestorableBool(false);
//     _isCropping = RestorableBool(false);
//     _isCircleUi = RestorableBool(true);
//     _loadAllImages();
//     super.initState();
//   }

//   Future<void> _loadAllImages() async {
//     if (this.mounted) {
//       setState(() {
//         _loadingImage = true;
//       });
//     }

//     // for (final image in widget.uin8ListImageData) {
//     //   _imageDataList.add(image);
//     // }
//     if (this.mounted) {
//       setState(() {
//         _loadingImage = false;
//       });
//     }
//   }

//   // Future<Uint8List> _load(String assetName) async {
//   //   final assetData = await rootBundle.load(assetName);
//   //   return assetData.buffer.asUint8List();
//   // }
//   @override
//   void dispose() {
//     _isSumbnail.dispose();
//     _isCropping.dispose();
//     _isCircleUi.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Center(
//           child: Visibility(
//             visible: !_loadingImage && !_isCropping.value,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Visibility(
//                     visible: _croppedData == null,
//                     child: Stack(
//                       children: [
//                         // if (_imageDataList.isNotEmpty)
//                         Crop(
//                           controller: _cropController,
//                           image: widget.uin8ListImageData,
//                           onCropped: (croppedData) {
//                             if (this.mounted) {
//                               setState(() {
//                                 _croppedData = croppedData;
//                                 _isCropping.value = false;
//                                 Navigator.of(context).pop(_croppedData);
//                               });
//                             }
//                           },
//                           withCircleUi: _isCircleUi.value,
//                           initialSize: 0.8,
//                           maskColor: _isSumbnail.value ? Colors.white : null,
//                           cornerDotBuilder: (size, edgeAlignment) =>
//                               _isSumbnail.value
//                                   ? const SizedBox.shrink()
//                                   : const DotControl(),
//                           baseColor: Colors.transparent,
//                         ),
//                         Positioned(
//                           right: 16,
//                           bottom: 16,
//                           child: GestureDetector(
//                             onTapDown: (_) {
//                               if (this.mounted) {
//                                 setState(() => _isSumbnail.value = true);
//                               }
//                             },
//                             onTapUp: (_) {
//                               if (mounted) {
//                                 setState(() => _isSumbnail.value = false);
//                               }
//                             },
//                             child: CircleAvatar(
//                               backgroundColor: _isSumbnail.value
//                                   ? Colors.blue.shade50
//                                   : Colors.blue,
//                               child: Center(
//                                 child: Icon(Icons.crop_free_rounded),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: Center(
//                       child: _croppedData == null
//                           ? SizedBox.shrink()
//                           : Image.memory(_croppedData!),
//                     ),
//                   ),
//                 ),
//                 if (_croppedData == null)
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.crop_square),
//                               onPressed: () {
//                                 _isCircleUi.value = false;
//                                 _cropController
//                                   ..withCircleUi = false
//                                   ..aspectRatio = 1;
//                               },
//                             ),
//                             IconButton(
//                                 icon: Icon(Icons.circle),
//                                 onPressed: () {
//                                   _isCircleUi.value = true;
//                                   _cropController.withCircleUi = true;
//                                 }),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Container(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (this.mounted) {
//                                 setState(() {
//                                   _isCropping.value = true;
//                                 });
//                               }

//                               _isCircleUi.value
//                                   ? _cropController.cropCircle()
//                                   : _cropController.crop();
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               child: Text('crop').tr(),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//             replacement: const CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   String? get restorationId => CropImageScreen.routeName;

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(
//         _isSumbnail, "${CropImageScreen.routeName}_is_sumbnail");
//     registerForRestoration(
//         _isCropping, "${CropImageScreen.routeName}_is_croping");
//     registerForRestoration(
//         _isCircleUi, "${CropImageScreen.routeName}_is_cricle_ui");
//   }
// }
