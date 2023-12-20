import UIKit


//Adapter Pattern

protocol Downloadable{
   func download() -> String
}


struct IntegerAPI{
    func fetch() -> Int{
        return 123
    }
}

// 1 way adapter pattern
struct IntegerAPIAdapter:Downloadable{
    func download() -> String {
        String(IntegerAPI().fetch())
    }
}

// 1 extensions way

struct StringAPI{
    func download() -> String{
        "Some string returning"
    }
}


extension StringAPI:Downloadable{}

extension IntegerAPI:Downloadable{
    func download() -> String {
        String(IntegerAPI().fetch())

    }
}



struct DataLoader{
    var api:Downloadable
    func downloadData()-> String{
        api.download()
    }
}


var dataLoader =  DataLoader(api: IntegerAPI())
dataLoader.downloadData()

dataLoader.api = StringAPI()
dataLoader.downloadData()

dataLoader.api = IntegerAPIAdapter()
dataLoader.downloadData()


// Factory creational pattern


