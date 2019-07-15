//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Mithun x on 7/15/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import Combine
import SwiftUI

class UpdateStore: BindableObject {
   var didChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         didChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}
