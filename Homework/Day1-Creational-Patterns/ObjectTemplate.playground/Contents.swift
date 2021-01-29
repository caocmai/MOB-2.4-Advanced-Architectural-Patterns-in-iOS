import UIKit

//var products = [
//   ("Kayak", "A boat for one person", 275.0, 10),
//   ("Lifejacket", "Protective and fashionable", 48.95, 14),
//   ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]

var products = [
   ("Kayak", 275.0, 10),
   ("Lifejacket", 48.95, 14),
   ("Soccer Ball", 19.5, 32)]

func calculateTax(product: (String, Double, Int)) -> Double {
    return Double(product.2) * 0.2;
}

func calculateStockValue(tuples: [(String, Double, Int)]) -> Double {
   return tuples.reduce(0, {
       (total, product) -> Double in
       return total + (product.1 * Double(product.2))
   });
}

//print("Sales tax for Kayak: $\(calculateTax(product: products[0]))")
//print("Total value of stock: $\(calculateStockValue(tuples: products))")

//Q: If we remove an element from each of the tuples, how will that effect the rest of the code?
// We get an error where the arguments are not correct/expected

//Analyze and discuss with your partner the various places in the code which must now be rewritten to accommodate this change to the product tuples.
// We then have to factor our code to using just 3 arguments instead of 4, which makes maintaining quite difficult.


class Product {
    
//    var products = [
//       ("Kayak", 275.0, 10),
//       ("Lifejacket", 48.95, 14),
//       ("Soccer Ball", 19.5, 32)]
    
    let product: (name: String, price: Double, tax: Int)
    
    func calculateTax(product: (String, Double, Int)) -> Double {
        return Double(product.2) * 0.2;
    }

    func calculateStockValue(tuples: [(String, Double, Int)]) -> Double {
       return tuples.reduce(0, {
           (total, product) -> Double in
           return total + (product.1 * Double(product.2))
       });
    }
    
//    init() {
//        print("Sales tax for Kayak: $\(calculateTax(product: products[0]))")
//        print("Total value of stock: $\(calculateStockValue(tuples: products))")
//    }
//
    init(product: (name: String, price: Double, tax: Int)) {

        self.product = (product.name, product.price, product.tax)
    }
}

let test = Product(product: (name: "test", price: 12.3, tax: 4))
print(test.product)
//print(test.calculateTax(product: (String, Double, Int)))
