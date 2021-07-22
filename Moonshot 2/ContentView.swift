//  ContentView.swift

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTIES
   
   let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   let missions: [Mission] = Bundle.main.decode("missions.json")
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(missions) { (mission: Mission) in
               NavigationLink(destination: MissionView(mission: mission,
                                                       astronauts: astronauts)) {
                  HStack {
                     Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                     VStack(alignment: .leading) {
                        Text(mission.displayName)
                           .font(.headline)
                        Text(mission.formattedLaunchDate)
                           .font(.subheadline)
                     }
                  }
               }
            }
         }
         .navigationBarTitle("Moonshot")
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
