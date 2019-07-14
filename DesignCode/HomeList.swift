//
//  HomeList.swift
//  DesignCode
//
//  Created by Mithun x on 7/13/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct HomeList: View {

   var courses = coursesData

   var body: some View {
      VStack {
         HStack {
            VStack(alignment: .leading) {
               Text("Courses")
                  .font(.largeTitle)
                  .fontWeight(.heavy)

               Text("22 Courses")
                  .color(.gray)
            }
            Spacer()
         }
         .padding(.leading, 70.0)
         .padding(.bottom, 40)

         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30.0) {
               ForEach(courses) { item in
                  PresentationLink(destination: ContentView()) {
                     CourseView(title: item.title,
                                image: item.image,
                                color: item.color,
                                shadowColor: item.shadowColor)
                  }
               }
            }
            .padding(.leading, 40)
            Spacer()
         }
      }
      .padding(.top, 78)
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

   var title = "Build an app with SwiftUI"
   var image = "Illustration1"
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .color(.white)
            .padding(30)
            .lineLimit(4)
            .padding(.trailing, 50)

         Spacer()

         Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
            .padding(.bottom, 30)
      }
      .background(color)
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}

struct Course: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let coursesData = [
   Course(title: "Build an app with SwiftUI",
          image: "Illustration1",
          color: Color("background3"),
          shadowColor: Color("backgroundShadow3")),
   Course(title: "Design Course",
          image: "Illustration2",
          color: Color("background4"),
          shadowColor: Color("backgroundShadow4"))
]
