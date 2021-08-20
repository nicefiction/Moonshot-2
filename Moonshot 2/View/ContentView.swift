//  ContentView.swift

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingCrewNames: Bool = false
   
   
   
   // MARK: - PROPERTIES
   
   let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   let missions: [Mission] = Bundle.main.decode("missions.json")
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(missions) { (mission: Mission) in
               NavigationLink(destination: MissionView(mission: mission,
                                                       astronauts: astronauts,
                                                       missions: missions)) {
                  HStack {
                     Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                     VStack(alignment: .leading) {
                        Text(mission.displayName)
                           .font(.headline)
                        Text(isShowingCrewNames
                              ? mission.crew.map { $0.name }.joined(separator: ", ")
                              : mission.formattedLaunchDate)
                           .font(.subheadline)
                     }
                  }
               }
            }
         }
         .navigationBarTitle("Moonshot")
         .navigationBarItems(trailing: Button(isShowingCrewNames ? "Show Launch Dates" : "Show Crew Names") {
            isShowingCrewNames.toggle()
         })
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
