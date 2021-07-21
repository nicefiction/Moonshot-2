//  Hierarchical Codable data.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/working-with-hierarchical-codable-data

import SwiftUI


struct Human: Codable {
   
   var name: String
   var address: Address
}


struct Address: Codable {
   
   var street: String
   var city: String
}



struct Hierarchical_Codable_data: View {
   
   // MARK: COMPUTED PROPERTIES
   
   var body: some View {
      
      Button("Decode JSON") {
         let input =  """
            {
               "name": "Dorothy Gale"
               "address": {
                  "street": "123, Wizard street"
                  "city": "Emerald"
               }
            }
         """.data(using: .utf8)! // OLIVIER
         
         
//         struct Human: Codable {
//
//            var name: String
//            var address: Address
//         }
//
//
//         struct Address: Codable {
//
//            var street: String
//            var city: String
//         }
         

         // let data = Data(input.utf8) // PAUL
         let jsonDecoder = JSONDecoder()
         if let _human = try? jsonDecoder.decode(Human.self,
                                                 // from: data) { // PAUL
                                                 from: input) { // OLIVIER
            print(_human.address.street)
         }
      }
   }
}




// MARK : - PREVIEWS -

struct Hierarchical_Codable_data_Previews: PreviewProvider {
   
   static var previews: some View {
      
      Hierarchical_Codable_data()
   }
}
