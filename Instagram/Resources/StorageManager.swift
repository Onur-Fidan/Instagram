//
//  StorageManager.swift
//  Instagram
//
//  Created by Onur Fidan on 27.08.2023.
//

import FirebaseStorage


public class StorageManager {
    
    static let shared = StorageManager()
    
    
    private let bucket = Storage.storage().reference()
    
    public enum IQStorageManagerError: Error {
        case failedToDowload
    }
    
    
    //MARK: - Public
    
    public func uploadUserPhotoPost(model: UserPost, comletion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    
    
    public func dowloadImage(with reference: String, completion: @escaping (Result<URL, IQStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDowload))
                return
            }
            completion(.success(url))
        }
    }
}

public enum UserPostType{
    case photo, video
}


public struct UserPost {
    let postType: UserPostType
}
