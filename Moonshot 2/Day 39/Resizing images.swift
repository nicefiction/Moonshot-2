//  1 Resizing images.swift

import SwiftUI



struct Resizing_images: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
//      Image("napoli")
//         .frame(width: 300,
//                height: 300,
//                alignment: .center)
//         .clipped()
      
      // VStack {
         GeometryReader { geometryProxy in
            Image("napoli")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: geometryProxy.size.width)
         }
      // }
   }
}





// MARK: - PREVIEWS -

struct Resizing_images_Previews: PreviewProvider {
   
   static var previews: some View {
      
      Resizing_images()
   }
}
