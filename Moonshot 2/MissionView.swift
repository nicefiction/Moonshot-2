// MissionView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/showing-mission-details-with-scrollview-and-geometryreader

import SwiftUI


struct MissionView: View {
   
   // MARK: - PROPERTIES
   
   let mission: Mission
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         ScrollView(.vertical) {
            VStack {
               Image(mission.imageName)
                  .resizable()
                  .scaledToFit()
                  .frame(width: (geometryProxy.size.width * 0.7))
                  .padding(.top)
               Text(mission.description)
                  .padding()
               Spacer(minLength: 25) // The Spacer has a guaranteed minimum height of at least 25 points .
            }
         }
      }
   }
}





// MARK: - PREVIEWS -

struct MissionView_Previews: PreviewProvider {
   
   // MARK: PROPERTIES
   
   static let missions: [Mission] = Bundle.main.decode("missions.json")
   
   
   // MARK: COMPUTED PROPERTIES
   
   static var previews: some View {
      
      MissionView(mission: missions[0])
   }
}
