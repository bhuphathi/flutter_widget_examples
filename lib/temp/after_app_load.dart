// 5. showdialog after loading app
// https://stackoverflow.com/questions/69493462/flutter-show-alertdialog-when-app-is-startup
// class _HomePageState extends State<HomePage> {

//   @override
//   void initState() {
//     super.initState();
//     if(widget.isDialogShow) // here you check
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) => Center(
//           child: AlertDialog(
//             insetPadding: EdgeInsets.all(20),
//             contentPadding: EdgeInsets.all(0),
//             content: Container(
//               height: 200,
//               width: MediaQuery.of(context).size.width,
//               child: Center(
//                 child: Text("Alert dialog in app start up"),
//               ),
//             ),
//             actions: <Widget>[],
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
