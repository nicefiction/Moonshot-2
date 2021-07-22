// MissionView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/showing-mission-details-with-scrollview-and-geometryreader

import SwiftUI


struct MissionView: View {
   
   // MARK: - NESTED TYPES
   
   struct CrewMember {
      
      let role: String
      let astronaut: Astronaut
   }
   
   
   
   // MARK: - PROPERTIES
   
   let mission: Mission
   let astronauts: [CrewMember]
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(mission: Mission,
        astronauts: [Astronaut]) {
      
      self.mission = mission
      
      var crewMembers = Array<CrewMember>()
      
      for crewMember in mission.crew {
         if let _crewMember = astronauts.first(where: { (astronaut: Astronaut) in
            astronaut.id == crewMember.name
         }) {
            crewMembers.append(CrewMember(role: crewMember.role,
                                          astronaut: _crewMember))
         } else {
            fatalError("Missing crew member \(crewMember.name).")
         }
      }
      
      self.astronauts = crewMembers
   }

      
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         ScrollView(.vertical) {
            VStack(spacing: 20.0) {
               Image(mission.imageName)
                  .resizable()
                  .scaledToFit()
                  .frame(width: (geometryProxy.size.width * 0.7))
               Text(mission.description)
               ForEach(astronauts,
                       id: \.astronaut.name) { (crewMember: CrewMember) in
                  
                  NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                     HStack {
                        Image(crewMember.astronaut.id)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 100)
                           .clipShape(Capsule())
                        VStack(alignment: .leading) {
                           Text(crewMember.astronaut.name)
                              .font(.headline)
                           Text(crewMember.role)
                              .font(.subheadline)
                              .foregroundColor(Color.gray)
                        }
                        Spacer()
                     }
                  }
               }
               Spacer(minLength: 25) // The Spacer has a guaranteed minimum height of at least 25 points .
            }
            .padding()
         }
         .navigationBarTitle(Text(mission.displayName),
                             displayMode: .inline)
      }
   }
}





// MARK: - PREVIEWS -

struct MissionView_Previews: PreviewProvider {
   
   // MARK: PROPERTIES
   
   static let missions: [Mission] = Bundle.main.decode("missions.json")
   static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   
   
   // MARK: COMPUTED PROPERTIES
   
   static var previews: some View {
      
      MissionView(mission: missions[0], astronauts: astronauts)
   }
}
