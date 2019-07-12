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
      ZStack {

         TitleView()
            .blur(radius: 20)

         CardBottomView()
            .blur(radius: 20)

         CardView()
            .offset(x: 0, y: -40)
            .scaleEffect(0.85)
            .rotationEffect(Angle(degrees: 15))
            .blendMode(.hardLight)

         CardView()
            .offset(x: 0, y: -20)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: 10))
            .blendMode(.hardLight)

         CertificateView()
            .scaleEffect(0.95)
            .rotationEffect(Angle(degrees: 5))
      }
   }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif

struct CardView: View {
   var body: some View {
      return VStack {
         Text("Card Back")
      }
      .frame(width: 340.0, height: 220.0)
      .background(Color.blue)
      .cornerRadius(10)
      .shadow(radius: 20)
   }
}

struct CertificateView: View {
   var body: some View {
      return VStack {
         HStack {
            VStack(alignment: .leading) {
               Text("UI Design")
                  .font(.headline)
                  .fontWeight(.bold)
                  .color(Color("accent"))
                  .padding(.top)
               Text("Certificate")
                  .color(.white)
            }
            Spacer()
            Image("Logo")
               .resizable()
               .frame(width: 30, height: 30)
         }
         .padding(.horizontal)
         Spacer()
         Image("Background")
      }
      .frame(width: 340.0, height: 220.0)
      .background(Color.black)
      .cornerRadius(10)
      .shadow(radius: 20)
   }
}

struct TitleView: View {
   var body: some View {
      return VStack {
         HStack {
            Text("Certificates")
               .font(.largeTitle)
               .fontWeight(.heavy)
            Spacer()
         }
         Image("Illustration5")
         Spacer()
      }.padding()
   }
}

struct CardBottomView: View {
   var body: some View {
      return VStack(spacing: 20.0) {
         Rectangle()
            .frame(width: 60, height: 6)
            .cornerRadius(3.0)
            .opacity(0.1)
         Text("This certificate is proof that Mithun has achieved UI Design course with approval from a Design+Code instructor.")
            .lineLimit(nil)
         Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding()
      .padding(.horizontal)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(radius: 20)
      .offset(y: 600)
   }
}
