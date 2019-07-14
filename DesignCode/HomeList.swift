//
//  HomeList.swift
//  DesignCode
//
//  Created by Mithun x on 7/13/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct HomeList: View {
   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         HStack {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
               CourseView()
            }
         }
         Spacer()
      }
   }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
   static var previews: some View {
      HomeList()
   }
}
#endif

struct CourseView: View {
   var body: some View {
      return VStack(alignment: .leading) {
         Text("Build an app with SwiftUI")
            .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
            .color(.white)
            .padding(20)
            .lineLimit(4)
            .frame(width: 150)

         Spacer()

         Image("Illustration1")
      }
      .background(Color("background3"))
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: Color("backgroundShadow3"), radius: 20, x: 0, y: 20)
   }
}
