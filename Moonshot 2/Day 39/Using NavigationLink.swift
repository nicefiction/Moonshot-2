//  Using NavigationLink.swift

import SwiftUI



struct Using_NavigationLink: View {
   
   var body: some View {
      
      NavigationView {
         // List(1..<10) { rowNumber in
         List {
            ForEach(1..<10) { rowNumber in
               // OPTIE 1 met Styling:
//               NavigationLink(destination: Text("Hello from row \(rowNumber)")) {
//                  Text("Hello 👋 World 🌍 \(rowNumber)")
//                     .font(.title)
//               }
               // OPTIE 2 zonder Styling :
               NavigationLink("Hello World 👉 \(rowNumber)",
                              destination: Text("Hello from row \(rowNumber)"))
            }
         }
         .navigationBarTitle("Hello World")
      }
   }
}




// MARK: - PREVIEWS -

struct Using_NavigationLink_Previews: PreviewProvider {
   static var previews: some View {
      Using_NavigationLink()
   }
}
