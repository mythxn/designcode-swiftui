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
   @State var showProfile = false

   var body: some View {
      ZStack {
         HomeList()
            .blur(radius: show ? 20 : 0)
            .scaleEffect(showProfile ? 0.95 : 0)
            .animation(.default)

         ContentView()
            .cornerRadius(30)
            .shadow(radius: 20)
            .animation(.fluidSpring())
            .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)

         MenuButton(show: $show)
            .offset(x: -30, y: showProfile ? 0 : 80)
            .animation(.fluidSpring())

         MenuRight(show: $showProfile)
            .offset(x: -16, y: showProfile ? 0 : 88)

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
      .background(BlurView(style: .systemMaterial))
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

struct CircleButton: View {

   var icon = "person.crop.circle"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(BlurView(style: .systemThickMaterial))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}

struct MenuButton: View {
   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topLeading) {
         Button(action: { self.show.toggle() }) {
            HStack {
               Spacer()

               Image(systemName: "list.dash")
                  .foregroundColor(.primary)
            }
            .padding(.trailing, 20)
            .frame(width: 90, height: 60)
            .background(BlurView(style: .systemThickMaterial))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
         }
         Spacer()
      }
   }
}

struct MenuRight: View {

   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topTrailing) {
         HStack {
            Button(action: { self.show.toggle() }) {
               CircleButton(icon: "person.crop.circle")
            }
            Button(action: { self.show.toggle() }) {
               CircleButton(icon: "bell")
            }
         }
         Spacer()
      }
   }
}
