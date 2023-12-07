// // MIT License
// //
// // Copyright (c) 2020 Dominik Roszkowski
// //
// // NOTICE: MultilineSnackBar based on
// // https://gist.github.com/slightfoot/4bb57f9ba7c4db46c8bedb33cdf9b93e
// // licensed under MIT License by Simon Lightfoot
// //
// // Permission is hereby granted, free of charge, to any person obtaining a copy
// // of this software and associated documentation files (the "Software"), to deal
// // in the Software without restriction, including without limitation the rights
// // to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// // copies of the Software, and to permit persons to whom the Software is
// // furnished to do so, subject to the following conditions:
// //
// // The above copyright notice and this permission notice shall be included in all
// // copies or substantial portions of the Software.
// //
// // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// // IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// // FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// // AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// // LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// // SOFTWARE.
// //

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: PageContent(),
//     );
//   }
// }

// class PageContent extends StatelessWidget {
//   const PageContent({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           FlatButton(
//             child: Text('Show floating long snackbar'),
//             onPressed: () {
//               Scaffold.of(context).showSnackBar(
//                 CustomSnackBar(
//                   content: Text('SnackBar with long multi-line content. '
//                       'SnackBar with long multi-line content. '
//                       'SnackBar with long multi-line content.'),
//                   action: SnackBarAction(
//                     label: 'Done',
//                     onPressed: () {},
//                   ),
//                   behavior: SnackBarBehavior.floating,
//                 ),
//               );
//             },
//           ),
//           FlatButton(
//             child: Text('Show fixed long snackbar'),
//             onPressed: () {
//               Scaffold.of(context).showSnackBar(
//                 CustomSnackBar(
//                   content: Text('SnackBar with long multi-line content. '
//                       'SnackBar with long multi-line content. '
//                       'SnackBar with long multi-line content.'),
//                   action: SnackBarAction(
//                     label: 'Done',
//                     onPressed: () {},
//                   ),
//                   behavior: SnackBarBehavior.fixed,
//                 ),
//               );
//             },
//           ),
//           FlatButton(
//             child: Text('Show snackbar'),
//             onPressed: () {
//               Scaffold.of(context).showSnackBar(
//                 CustomSnackBar(
//                   content: Text('SnackBar'),
//                   action: SnackBarAction(
//                     label: 'Done',
//                     onPressed: () {},
//                   ),
//                   behavior: SnackBarBehavior.floating,
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 8.0),
//           CustomSnackBar(
//             content: Text('SnackBar'),
//             action: SnackBarAction(
//               label: 'Done',
//               onPressed: () {},
//             ),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           SizedBox(height: 8.0),
//           CustomSnackBar(
//             content: Text('SnackBar with long multi-line content. '
//                 'SnackBar with long multi-line content. '
//                 'One or two line string.'),
//             action: SnackBarAction(
//               label: 'Longer Action Text',
//               onPressed: () {},
//             ),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           CustomSnackBar(
//             content: Text('SnackBar with long multi-line content. '
//                 'Aa bb cc dd ee ff gg hh'),
//             action: SnackBarAction(
//               label: 'Action Text',
//               onPressed: () {},
//             ),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           SizedBox(height: 8.0),
//           CustomSnackBar(
//             content: Text('SnackBar with content defined as Text'),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           SizedBox(height: 8.0),
//           CustomSnackBar(
//             content: Row(
//               children: [
//                 Icon(Icons.favorite),
//                 SizedBox(width: 8),
//                 Flexible(child: Text('SnackBar with content defined as Row')),
//               ],
//             ),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           SizedBox(height: 8.0),
//           CustomSnackBar(
//             content: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.warning),
//                 SizedBox(width: 8),
//                 Flexible(
//                     child: Text(
//                         'When using Row you may need to provide mainAxisSize: MainAxisSize.min')),
//               ],
//             ),
//             action: SnackBarAction(
//               label: 'Action Text',
//               onPressed: () {},
//             ),
//             animation: AlwaysStoppedAnimation(1.0),
//           ),
//           SizedBox(height: 8.0),
//         ],
//       ),
//     );
//   }
// }

// class CustomSnackBar extends SnackBar {
//   CustomSnackBar({
//     Key key,
//     @required Widget content,
//     this.backgroundColor,
//     this.elevation,
//     this.shape,
//     this.behavior = SnackBarBehavior.floating,
//     Widget action,
//     this.duration = const Duration(milliseconds: 4000),
//     this.animation,
//     this.onVisible,
//   })  : action = null,
//         content = MultilineSnackBar(
//           content: Padding(
//             padding: const EdgeInsetsDirectional.only(end: 8.0),
//             child: content,
//           ),
//           action: action != null
//               ? ButtonTheme(
//                   textTheme: ButtonTextTheme.accent,
//                   height: 22.0,
//                   minWidth: 44.0,
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   child: action,
//                 )
//               : const SizedBox(),
//           verticalSpacing: 8.0,
//         ),
//         super(
//           key: key,
//           content: content,
//           backgroundColor: backgroundColor,
//           elevation: elevation,
//           shape: shape,
//           behavior: behavior,
//           action: null,
//           duration: duration,
//           animation: animation,
//           onVisible: onVisible,
//         );

//   final Widget content;

//   final Color backgroundColor;

//   final double elevation;

//   final ShapeBorder shape;

//   final SnackBarBehavior behavior;

//   final SnackBarAction action;

//   final Duration duration;

//   final Animation<double> animation;

//   final VoidCallback onVisible;
// }

// class MultilineSnackBar extends MultiChildRenderObjectWidget {
//   MultilineSnackBar({
//     Key key,
//     this.content,
//     this.action = const SizedBox(),
//     this.verticalSpacing = 8.0,
//   })  : assert(content != null),
//         assert(action != null),
//         assert(verticalSpacing != null),
//         super(key: key, children: [content, action]);

//   final Widget content;
//   final Widget action;
//   final double verticalSpacing;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderMultilineSnackBar(
//       spacing: verticalSpacing,
//     );
//   }

//   @override
//   void updateRenderObject(
//       BuildContext context, RenderMultilineSnackBar renderObject) {
//     renderObject..spacing = verticalSpacing;
//   }
// }

// class RenderMultilineSnackBar extends RenderBox
//     with
//         ContainerRenderObjectMixin<RenderBox, _MultilineSnackBarParentData>,
//         RenderBoxContainerDefaultsMixin<RenderBox,
//             _MultilineSnackBarParentData> {
//   RenderMultilineSnackBar({
//     double spacing,
//     List<RenderBox> children,
//   }) : _spacing = spacing {
//     addAll(children);
//   }

//   double _spacing;
//   double get spacing => _spacing;

//   set spacing(double value) {
//     if (value == _spacing) return;
//     _spacing = value;
//     markNeedsLayout();
//   }

//   RenderBox get content => firstChild;

//   RenderBox get action => lastChild;

//   @override
//   void setupParentData(RenderBox child) {
//     if (child.parentData is! _MultilineSnackBarParentData) {
//       child.parentData = _MultilineSnackBarParentData();
//     }
//   }

//   @override
//   double computeMinIntrinsicWidth(double height) => 0.0;

//   @override
//   double computeMaxIntrinsicWidth(double height) => 0.0;

//   @override
//   double computeMinIntrinsicHeight(double width) {
//     return math.max(
//       content.getMinIntrinsicHeight(width),
//       action.getMinIntrinsicHeight(width),
//     );
//   }

//   @override
//   double computeMaxIntrinsicHeight(double width) {
//     return content.getMaxIntrinsicHeight(width) +
//         action.getMaxIntrinsicHeight(width) +
//         spacing;
//   }

//   // @override
//   // Size get size => super.size ?? Size(0, 0);

//   @override
//   void performLayout() {
//     assert(constraints.hasBoundedWidth);

//     final width = constraints.maxWidth;
//     if (constraints.hasBoundedHeight) {
//       final height = constraints.maxHeight;
//       size = constraints.constrain(Size(width, height));
//     } else {
//       size = constraints.constrain(Size(width, 10000.0));
//     }

//     final minHeight = computeMinIntrinsicHeight(width);
//     final maxHeight = computeMaxIntrinsicHeight(width);

//     action.layout(
//       BoxConstraints.loose(size),
//       parentUsesSize: true,
//     );
//     final actionData = action.parentData as _MultilineSnackBarParentData;

//     print('Action: ${action.size}');

//     content.layout(
//       BoxConstraints(
//         minWidth: 0.0,
//         maxWidth: width,
//         minHeight: minHeight,
//         maxHeight: maxHeight,
//       ),
//       parentUsesSize: true,
//     );
//     print('Content: ${content.size}');
//     print('Size: $size');
//     var totalHeight = content.size.height;

//     if (content.size.width > width - action.size.width) {
//       print('Text size larger than width - action');
//       final verticalOffset = content.size.height + spacing;
//       totalHeight = verticalOffset + action.size.height;
//       actionData.offset = Offset(width - action.size.width, verticalOffset);
//     } else {
//       print('Text size smaller than width - action');
//       actionData.offset = Offset(width - action.size.width, 0.0);
//     }

//     size = constraints.constrain(Size(width, totalHeight));
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     defaultPaint(context, offset);
//   }

//   @override
//   bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
//     return defaultHitTestChildren(result, position: position);
//   }
// }

// class _MultilineSnackBarParentData extends ContainerBoxParentData<RenderBox> {}