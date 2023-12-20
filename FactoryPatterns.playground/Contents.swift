import UIKit


protocol Computer {
    func aboutDevice() -> String
}

struct OperatingSystem{
    enum SystemType:String{
        case iOS
        case iPadOS
        case macOS
    }
    var version:Int
    var type:SystemType
}


struct Mac:Computer{
    var system:OperatingSystem
    
    init(system:OperatingSystem){
        self.system = system
    }
    
    func aboutDevice() -> String {
        return "Mac:\(system.type.rawValue) \(system.version)"
    }
}


struct iPhone:Computer{
    var system:OperatingSystem
    
    init(system:OperatingSystem){
        self.system = system
    }
    
    func aboutDevice() -> String {
     return "iPhone:\(system.type.rawValue) \(system.version)"
    }
}


struct iPad:Computer{
    var system:OperatingSystem
    
    init(system:OperatingSystem){
        self.system = system
    }
    
    func aboutDevice() -> String {
     return "iPad:\(system.type.rawValue) \(system.version)"
    }
}


struct macOs:Computer{
    var system:OperatingSystem
    
    init(system:OperatingSystem){
        self.system = system
    }
    
    func aboutDevice() -> String {
     return "macOs:\(system.type.rawValue) \(system.version)"
    }
}


struct ComputerFactory {
    
    static func MakeComputer(system:OperatingSystem) -> Computer{
        
        switch system.type{
            
        case .iOS:
          return  iPhone(system: system)
        case .iPadOS:
          return  iPad(system: system)

        case .macOS:
           return Mac(system: system)
        }
    }
}

let computer = ComputerFactory.MakeComputer(system: OperatingSystem(version: 21, type: .iOS))
print(computer.aboutDevice())
