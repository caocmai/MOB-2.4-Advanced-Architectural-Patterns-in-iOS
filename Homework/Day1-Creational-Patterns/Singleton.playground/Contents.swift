import UIKit

class DataSource {
    
    static var sharedInstance = DataSource()
    
    var creationalPatternsArray = ["Abstract Factory", "Factory Method",
                          "Builder", "Dependency Injection", "Lazy Initialization",
                          "Object Pool", "Prototype", "Singleton"]
    
    private init() {
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
    }
}


let data = DataSource.sharedInstance

func looper(){

  for num in 1...5 {
          _ = DataSource.sharedInstance
          print("num is:", num)
    }
}
looper()


//Q: What is surprising or noteworthy about the result of running looper()?
// The DataSource is instantiate only once



//Q: What use cases can you imagine for the Singleton pattern?
// If it's shared then there's a possibility that it gets used at the same time
