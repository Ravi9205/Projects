import UIKit


enum profileType{
    case normal
    case privillaged
}


protocol ProfileView{
    var profileImageView:UIImageView {get set}
    var userNameLabel:UILabel{get set}
    var coinsLabel:UILabel{get set}
}


/*
class ProfileViewFactory{
    func getProfileView(profileType:profileType) -> UIView{
        
        switch profileType{
            
        case .normal:
            print("Loading Normal ProfileView")
            return UIView()
        case .privillaged:
            print("Privilaged ProfileView")
            return PrivilagedProfileView()
        }
    }
}

class NormalProfileView:UIView,ProfileView{
    var profileImageView: UIImageView
    var userNameLabel: UILabel
    var coinsLabel: UILabel
   
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

protocol ProfileViewFactoryProtocal{
    func getProfile(type:profileType,user:User)
    
}

class PrivilagedProfileView:UIView,ProfileView{
    var profileImageView: UIImageView
    var userNameLabel: UILabel
    var coinsLabel: UILabel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct User{
    var name:String
    var address:String
    var id:Int
}

*/

//Another example of Factory Design Patterns

protocol Computer {
    func getDevice() -> String
}

struct operatingSystem {
    
    enum SystemType: String{
        case iOS
        case macOS
        case windows
        case andriod
    }
    
    var version:Int
    var type:SystemType
}


struct Mac:Computer{
    var system:operatingSystem
    init(system:operatingSystem) {
        self.system = system
    }
    func getDevice() -> String {
        return "Mac:\(system.type.rawValue) \(system.version)"
    }
}


struct iPhone:Computer{
    var system:operatingSystem
    
    init(system:operatingSystem) {
        self.system = system
    }

    func getDevice() -> String {
        return "iPhone:\(system.type.rawValue) \(system.version)"
    }
}

struct Windows:Computer{
    var system:operatingSystem
    
    init(system:operatingSystem) {
        self.system = system
    }
    
    func getDevice() -> String {
        return "Windows:\(system.type.rawValue) \(system.version)"
    }
}

struct Andriod:Computer{
    var system:operatingSystem
    init(system:operatingSystem) {
        self.system = system
    }
    func getDevice() -> String {
        return "Andriod:\(system.type.rawValue) \(system.version)"
    }
}


struct ComputerFactory {
    static func makeComputer(system:operatingSystem) -> Computer{
        switch system.type{
        case .iOS:
            return iPhone(system: system)
        case .macOS:
            return Mac(system: system)
        case .windows:
            return Windows(system: system)
        case .andriod:
            return Andriod(system: system)
        }
    }
}

let computer = ComputerFactory.makeComputer(system: operatingSystem(version: 16, type: .iOS))
//print(computer.getDevice())

var systems:[operatingSystem] = [
    operatingSystem(version: 14, type: .iOS),
    operatingSystem(version: 15, type: .andriod),
    operatingSystem(version: 23 , type: .windows),
    operatingSystem(version: 6, type: .macOS)
]

systems.forEach{ print(ComputerFactory.makeComputer(system: $0).getDevice())}
