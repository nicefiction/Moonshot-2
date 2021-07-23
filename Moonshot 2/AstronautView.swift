// AstronautView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/fixing-problems-with-buttonstyle-and-layoutpriority

import SwiftUI



struct AstronautView: View {
   
   // MARK: - PROPERTIES
   
   let astronaut: Astronaut
   var missions: [Mission]
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(astronaut: Astronaut,
        missions: [Mission]) {
      
      self.astronaut = astronaut
      var matchedMissions = Array<Mission>()
      
      for mission in missions {
         if let _ = mission.crew.first(where: { (crewRole: Mission.CrewRole) in
            crewRole.name == astronaut.id
         }) {
            matchedMissions.append(mission)
         }
      }
      
      self.missions = matchedMissions
   }
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         ScrollView(.vertical) {
            VStack {
               Image(astronaut.id)
                  .resizable()
                  .scaledToFit()
                  .clipShape(Capsule())
               ForEach(missions) { (mission: Mission) in
                  Text(mission.displayName)
                     .font(.headline)
               }
               Text(astronaut.description)
                  .padding(.top, 5.0)
                  .layoutPriority(1)
               /**
                Layout priority lets us control how readily a view shrinks when space is limited ,
                or expands when space is plentiful. All views have a layout priority of 0 by default , which means they each get equal chance to grow or shrink .
                We are going to give our astronaut description a layout priority of 1 ,
                which is higher than the image’s 0 ,
                which means it will automatically take up all available space .
                */
            }
            .padding()
         }
      }
      .navigationBarTitle(Text(astronaut.name),
                          displayMode: .inline)
   }
}





// MARK: - PREVIEWS -

struct AstronautView_Previews: PreviewProvider {
   
   // MARK: - PROPERTIES
   
   static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   static let missions: [Mission] = Bundle.main.decode("missions.json")
   
   
   // MARK: - COMPUTED PROPERTIES
   
   static var previews: some View {
      
      AstronautView(astronaut: astronauts[0],
                    missions: missions)
   }
}
