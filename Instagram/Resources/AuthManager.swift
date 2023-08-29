//
//  AuthManager.swift
//  Instagram
//
//  Created by Onur Fidan on 27.08.2023.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


public class AuthManager {
    
    static let shared = AuthManager()
    
    //MARK: - Register New User
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        /*
         - Check if username is available
         - Check if email is available
         
         */
        
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - Create Account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: username) { result, error in
                    guard error == nil, result != nil else{
                        //Firbase auth could not create account
                        completion(false)
                        return
                    }
                    
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            //Failed to insert to databse
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                //either username or email does not exist
                completion(false)
            }
        }
        
        
    }
    
    
    
    
    //MARK: - Login User
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
            if let email = email {
                //email login
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    
                   
                    
                    guard authResult != nil, error == nil else {
                        completion(false)
                        return
                    }

                    completion(true)
                    
                    
                }
            } else if let username = username {
                //Username log in
                print(username)
            }
        
        
        
    }
    
    /// Attempt to log out firebse users
    public func logOut(completion: (Bool) -> Void) {
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            completion(false)
            print(error)
            return
        }
    }
    
    
}
