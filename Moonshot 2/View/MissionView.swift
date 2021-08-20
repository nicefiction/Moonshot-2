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
   let missions: [Mission]
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(mission: Mission,
        astronauts: [Astronaut],
        missions: [Mission]) {
      
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
      self.missions = missions
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
                  .accessibility(label: Text("\(mission.imageName) Mission"))
               HStack {
                  Text("Launch Date :")
                     .fontWeight(.semibold)
                  Text(mission.formattedLaunchDate)
                  Spacer()
               }
               .accessibilityElement(children: .ignore)
               .accessibility(label: Text("Launch Date: \(mission.formattedLaunchDate)"))
               Text(mission.description)
               ForEach(astronauts,
                       id: \.astronaut.name) { (crewMember: CrewMember) in
                  
                  NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut,
                                                            missions: missions)) {
                     HStack {
                        Image(crewMember.astronaut.id)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 100)
                           .clipShape(Capsule())
                           .accessibility(label: Text(crewMember.astronaut.name))
                        VStack(alignment: .leading) {
                           Text(crewMember.astronaut.name)
                              .font(.headline)
                              .accessibility(hidden: true)
                           Text(crewMember.role)
                              .font(.subheadline)
                              .foregroundColor(Color.gray)
                              .accessibility(label: Text("Role: \(crewMember.role)"))
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
      
      MissionView(mission: missions[0],
                  astronauts: astronauts,
                  missions: missions)
   }
}
