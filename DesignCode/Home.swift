//
//  Home.swift
//  DesignCode
//
//  Created by Mithun x on 7/12/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct Home: View {

   @State var show = false

   var body: some View {
      ZStack {
         Button(action: { self.show.toggle() }) {
            Text("Open Menu")
         }
         MenuView(show: $show)
      }
   }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
   static var previews: some View {
      Home()
   }
}
#endif

struct MenuRow: View {

   var image = "creditcard"
   var text = "My Account"

   var body: some View {
      return HStack {
         Image(systemName: image)
            .imageScale(.large)
            .foregroundColor(Color("icons"))
            .frame(width: 32, height: 32)

         Text(text)
            .font(.headline)

         Spacer()
      }
   }
}

struct Menu: Identifiable {
   var id = UUID()
   var title: String
   var icon: String
}

let menuData = [
   Menu(title: "My Account", icon: "person.crop.circle"),
   Menu(title: "Billing", icon: "creditcard"),
   Menu(title: "Team", icon: "person.and.person"),
   Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {

   var menu = menuData
   @Binding var show: Bool

   var body: some View {
      return VStack(alignment: .leading) {
         ForEach(menu) { item in
            MenuRow(image: item.icon, text: item.title)
         }
         Spacer()
      }
      .padding(.top, 20)
      .padding(30)
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(30)
      .padding(.trailing, 60)
      .shadow(radius: 20)
      .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
      .animation(.basic())
      .offset(x: show ? 0 : -UIScreen.main.bounds.width)
      .tapAction {
         self.show.toggle()
      }
   }
}
