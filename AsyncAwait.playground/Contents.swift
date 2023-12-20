import UIKit




//Aync await can be useful in read only property
extension UIImage{
    var thumbnail:UIImage{
        get async{
            let size = CGSize(width: 50, height: 50)
            return await self.byPreparingThumbnail(ofSize: size)!
        }
        
    }
}

//awaits also works in loops (for,while) but there is only catch with it should
//confirm async sequence protocal

//
//for await id in someAsyncFunction(){
//    //your code
//}
