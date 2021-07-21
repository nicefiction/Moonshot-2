//  ContentView.swift

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTIES
   
   let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   let missions: [Mission] = Bundle.main.decode("missions.json")
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text("\(astronauts.count) astronauts")
         .font(.largeTitle)
         .fontWeight(.semibold)
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
