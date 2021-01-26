//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

enum BicycleSize: String {
   case small
   case medium
   case large
}

enum BicycleType : String {
   case kids
   case standard
   case mountain
}

struct Bicycle
{
   public let type: BicycleType
   public let color: UIColor
   public let size: BicycleSize
}

extension Bicycle: CustomStringConvertible {
   public var description: String {
       return type.rawValue + " bicycle"
   }
}

// Builder Protocol
protocol BikeBuilder {
   var type: BicycleType { get set }
   var color: UIColor { get set }
   var size: BicycleSize { get set }

   func construct() -> Bicycle
}

// MARK: - Builder
class BicycleBuilder: BikeBuilder {

   var type: BicycleType = .standard
   var color: UIColor = .gray
   var size: BicycleSize = .medium

   func construct() -> Bicycle {
       return Bicycle(type: type, color: color, size: size)
   }
}

// MARK: - Director
public class BikeAssembler {

   // Build a kids bike
   func createKidsBike() -> Bicycle {
       let builder = BicycleBuilder()
       builder.type = .kids
       builder.size = .small
       return builder.construct()
   }

   // TODO: 1) build the Mountain bike
    func createMountainBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .mountain
        builder.size = .small
        return builder.construct()
    }

   // TODO: 2) the Standard bike
    func createStandardBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .standard
        builder.size = .small
        return builder.construct()
    }

}

//let bikeAssembler = BikeAssembler()
//let kids = bikeAssembler.createKidsBike()
//print(kids.description)
//
//let mountain = bikeAssembler.createMountainBike()
//print(mountain.description)
//
//let standard = bikeAssembler.createStandardBike()
//print(standard.description)


class CalTax {
    
    static let single = CalTax()

    var products = [
       ("Kayak", "A boat for one person", 275.0, 10),
       ("Lifejacket", "Protective and fashionable", 48.95, 14),
       ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]
    
    func calculateTax(product:(String, String, Double, Int)) -> Double {
       return product.2 * 0.2;
    }
    
    func calculateStockValue(tuples:[(String, String, Double, Int)]) -> Double {
       return tuples.reduce(0, {
           (total, product) -> Double in
           return total + (product.2 * Double(product.3))
       });
    }
    
    private init() {
        print("Sales tax for Kayak: $\(calculateTax(product: products[0]))")
        print("Total value of stock: $\(calculateStockValue(tuples: products))")
    }

    
}


//let tax = CalTax.single


var products = [
   ("Kayak", "A boat for one person", 275.0, 10),
   ("Lifejacket", "Protective and fashionable", 48.95, 14),
   ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]

let product = ("Kayak", "ME", 12.3, 1)

print(product.2 * 0.2)
