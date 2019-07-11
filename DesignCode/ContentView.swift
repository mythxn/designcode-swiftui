//
//  ContentView.swift
//  DesignCode
//
//  Created by Mithun x on 7/11/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         VStack {
            Text("UI Design")
               .font(.title)
               .fontWeight(.bold)
               .color(Color("accent"))
               .padding(.top)
            Text("Certificate")
               .color(.white)
         }
         Image("Background")
      }
      .background(Color.black)
      .cornerRadius(10)
   }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif
