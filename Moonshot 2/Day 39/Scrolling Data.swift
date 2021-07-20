//  Scrolling Data.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data

import SwiftUI


struct CustomText: View {
   
   // MARK: - PROPERTIES
   
   var text: String
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text(text)
   }
   
   
   // MARK: - INITIALZER METHODS
   
   init(_ text: String) {
      
      print("Printing test .")
      self.text = text
   }
}



struct Scrolling_Data: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
//      ScrollView(.vertical) {
//         VStack(spacing: 10.0) {
//            ForEach(1..<100) { (number: Int) in
//               // Text("Hello 👋 World 🌍")
//               CustomText("Item \(number)")
//                  .font(.title)
//            }
//         }
//         .frame(maxWidth: .infinity)
//      } // With a ScrollView , Xcode creates all the instances of CustomText immediately .
      List {
         ForEach(0..<100) {
            CustomText("Hello \($0)")
         }
      } // With a List , Xcode creates instances of CustomText only when really needed . The code acts lazily .
   }
}




// MARK: - PREVIEWS -

struct Scrolling_Data_Previews: PreviewProvider {
   
   static var previews: some View {
      
      Scrolling_Data()
   }
}
