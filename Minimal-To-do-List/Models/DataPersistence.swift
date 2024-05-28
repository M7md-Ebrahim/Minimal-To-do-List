//
//  DataPersistence.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import Foundation
import RealmSwift

enum DatabasError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}
class DataPersistence {
    static let shared = DataPersistence()
    func createTask(_ taskModel: TaskModel, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let task = RealmTaskModel()
        task.taskName = taskModel.taskName
        task.taskDone = taskModel.taskDone
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(task)
            }
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
    }
    func fetchTasks(completion: @escaping (Result<[RealmTaskModel], Error>) -> Void) {
        do {
            let realm = try Realm()
            let tasks = realm.objects(RealmTaskModel.self)
            completion(.success(Array(tasks)))
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    func removeTask(_ task: RealmTaskModel, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(task)
            }
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
}
