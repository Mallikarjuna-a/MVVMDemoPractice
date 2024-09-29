//
//  PostListViewModel.swift
//  DemoProjectMVVM
//
//  Created by Mallikarjuna A on 30/08/24.
//

import Foundation
class PostListViewModel {
    var postList = [PostModel]()
    var networkService = Server()
    let urlPath = "https://jsonplaceholder.typicode.com/posts"
    
    
    func loadPosts(completion:@escaping(Bool)->Void) {
        
        
        Task {
            do {
                let (post, _) = try await networkService.fetchData(with: .GET, path: urlPath, responseModel: [PostModel].self)
                postList = post
                debugPrint(post)
                completion(true)
            }catch let error {
                completion(false)
                debugPrint(error)
            }
        }
    }
    
    
}
extension PostListViewModel {
    func postAtIndex(at index:Int) -> PostViewModel {
        return PostViewModel(post: postList[index])
    }
}

struct PostViewModel {
    var post : PostModel
}
extension PostViewModel {
    var title : String {
        return post.title ?? "No title"
    }
}
