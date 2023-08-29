//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Onur Fidan on 27.08.2023.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    //MARK: - Public
    
    
    ///Check if username and email is available
    /// - Parameters
    ///             - email: String representing emial
    ///             - username : String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    
    ///Insert new user data to databse
    /// - Parameters
    ///             - email: String representing emial
    ///             - username : String representing username
    ///             - completion : Async callback for result if database entry succede
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
    
    
    
    

}



