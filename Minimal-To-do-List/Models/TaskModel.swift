//
//  TaskModel.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import Foundation
import RealmSwift
class MovieModel: Object {
    @Persisted var taskName: String?
    @Persisted var taskDone: Bool = false
}
