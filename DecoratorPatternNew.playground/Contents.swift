import UIKit

//Decorator Pattern New

// The Decorator Design Pattern is a structural pattern that allows behavior to be added to individual objects, either statically or dynamically, without affecting the behavior of other objects from the same class. Here's an example of how you can implement the Decorator Design Pattern in Swift for iOS:

//Protocal Component
protocol Coffee{
    func cost()->Double
    func description() -> String
}


// Concrete component

class SimpleCoffee:Coffee{
    func cost() -> Double {
        return 1.0
    }
    
    func description() -> String {
        return "Simple Coffee"
    }
    
}

//Decorator base Class

class CoffeeDecorator:Coffee{
    let decoraterCoffee:Coffee

    init(_coffee:Coffee) {
        self.decoraterCoffee = _coffee
    }
    
    func cost() -> Double {
        return decoraterCoffee.cost()
    }
    
    func description() -> String {
        return decoraterCoffee.description()
    }
}


//Concrete Decorator 1
class MilkDecorator:CoffeeDecorator{
    
    override func cost() -> Double {
        return super.cost() + 0.5
    }
    
    override func description() -> String {
        return super.description() + ", With Milk"
    }
}


//Concreate Decorator 2
class SugarDecorator:CoffeeDecorator{
    
    override func cost() -> Double {
        return super.cost() + 0.3
    }
    
    override func description() -> String {
        return super.description() + ", With Sugar"
    }
    
}

var coffee:Coffee = SimpleCoffee()

coffee = MilkDecorator(_coffee: coffee)

coffee = SugarDecorator(_coffee: coffee)

print("Cost: \(coffee.cost())")
print("Coffee Descriptions: \(coffee.description())")




//The Memento Design Pattern is a behavioral pattern that allows an object's state to be captured and restored at a later time. It's particularly useful when you need to implement undo functionality or persist the state of an object.

//Here's an example of how you can implement the Memento pattern in Swift for iOS:


class TextEditor{
    
    private var text:String = ""

    func write(text:String){
        self.text += text
    }
    
    func getState()-> EditorMemento{
        return EditorMemento(state: text)
    }
    
    func getState(memento:EditorMemento){
        self.text = memento.getState()
    }
    
    func printText(){
        print(text)
    }
    
}


class EditorMemento{
    private var state:String
    
    init(state:String){
        self.state = state
    }
    
    func getState() -> String{
        return state
    }
    
    func setState(memento:EditorMemento){
        self.state = memento.getState()
    }
}


class History {
    
    private var mementos:[EditorMemento] = []
    
    func saveState(editor:TextEditor){
        mementos.append(editor.getState())
    }
    
    func restoreState(editor:TextEditor){
        guard let lastMemento = mementos.popLast() else { return}
        editor.getState(memento: lastMemento)
        
    }
    
}


let editor = TextEditor()

let history = History()

editor.write(text:"Hello World")
history.saveState(editor: editor)

editor.write(text:" Good Morning")
editor.printText()


history.restoreState(editor: editor)
editor.printText()

