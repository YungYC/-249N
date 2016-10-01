//
//  FirebaseReference.swift
//  -249N
//
//  Created by Duncan on 2016/7/3.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import Foundation
import Firebase


let DataRef = FIRDatabase.database().reference()

let storage = FIRStorage.storage()
let storageRef = storage.referenceForURL("gs://n-901af.appspot.com")
