import 'package:ball_dont_lie/features/Webview/webview_screen.dart';
import 'package:ball_dont_lie/providers/transfer_provider.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';
import 'package:provider/provider.dart';

class TransferPage extends StatefulWidget 
{
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> with AutomaticKeepAliveClientMixin<TransferPage>
{
  @override
  bool get wantKeepAlive => true;

   @override
  void initState() 
  {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    // {
    //   Provider.of<TransferProvider>(context,listen: false).getNews(UserProvider.user!.favLeague);
    // });
    
  }


  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          centerTitle: true,
          title: const Text('League News'),
        ),
        body: const Center(child: Text('Transfer Page'),),
        // body: Consumer<TransferProvider>(builder: (context, value, child) 
        // {
        //   if(value.isLoading==true)
        //   {
        //     return const Center
        //     (
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        //   else if(value.isError)
        //   {
        //     return  const Center(child: Icon(Icons.error));
        //   }
        //   final fetchedNews=value.getTeams;
        //   return ListView.builder
        //   (
        //     itemCount: fetchedNews.length,
        //     itemBuilder:(context,index)
        //     {
        //       return InkWell
        //       (
        //         onTap: ()
        //         {
        //           Navigator.of(context).push
        //           (
        //             MaterialPageRoute
        //             (
        //               builder: (context)=>WebViewApp(url:fetchedNews[index].newsLink!) 
        //             )
        //           );
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(16.0),
        //           child: NeoPopCard
        //           (
        //             color: Colors.white24,
        //             borderColor:Colors.black,
        //             depth: 10,
        //             hShadowColor: Colors.purpleAccent,
        //             vShadowColor: Colors.deepPurpleAccent,
        //             child: ListTile
        //             (
        //               leading: CircleAvatar
        //               (
        //                 child: CachedNetworkImage
        //                 (
        //                   width: 80.0,
        //                   height: 80.0,
        //                   imageUrl: fetchedNews[index].image!,
        //                   progressIndicatorBuilder: (context, url, progress)
        //                   {
        //                     return CircularProgressIndicator
        //                     (
        //                       value: progress.progress,
        //                     );
        //                   },
        //                   errorWidget: (context, url, error) 
        //                   {
        //                     return const Icon(Icons.error);
        //                   }, 
        //                 ),
        //               ),
        //               title: Text(fetchedNews[index].title!,style: Theme.of(context).textTheme.titleMedium,),
        //               subtitle: Text(fetchedNews[index].publisherDate!),
        //               // trailing: ClipOval
        //               // (
        //               //   child: CachedNetworkImage
        //               //   (
        //               //     imageUrl: fetchedNews[index].publisherName!,
        //               //     progressIndicatorBuilder: (context, url, progress)
        //               //     {
        //               //       return CircularProgressIndicator
        //               //       (
        //               //         value: progress.progress,
        //               //       );
        //               //     },
        //               //     errorWidget: (context, url, error) 
        //               //     {
        //               //       return const Icon(Icons.error);
        //               //     }, 
        //               //   ),
        //               // ),
        //             ),
        //           ),
        //         ),
        //       );
        //     }
        //   );
        // },),
      ),
    );
  }
}