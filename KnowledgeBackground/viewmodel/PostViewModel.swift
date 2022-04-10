
import Foundation

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var post = Post()
    
    @Published var isLoading = false
    @Published var isCreated = false
    @Published var isUpdated = false
    @Published var isDeleted = false
    
    // Post List API
//    func apiPostList() {
//        self.isLoading = true
//        AFHttp.get(url: AFHttp.API_POST_LIST, params: [:], handler: { response in
//            self.isLoading = false
//            switch response.result {
//            case .success:
//                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
//                self.posts = posts
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
    
    // Single Post API
//    func apiPostSingle(id: Int) {
//        self.isLoading = true
//        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: [:], handler: { response in
//            self.isLoading = false
//            switch response.result {
//            case .success:
//                let post = try! JSONDecoder().decode(Post.self, from: response.data!)
//                self.post = post
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
    
    // Create Post Api
//    func apiPostCreate(post: Post) {
//        self.isLoading = true
//        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
//            self.isLoading = false
//            switch response.result {
//            case .success:
//                print(response.result)
//                self.isCreated = true
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
    
    // Update Post Api
//    func apiPostUpdate(post: Post) {
//        self.isLoading = true
//        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
//            self.isLoading = false
//            switch response.result {
//            case .success:
//                print(response.result)
//                self.isUpdated = true
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
    
    // Delete Post Api
//    func apiPostDelete(post: Post) {
//        self.isLoading = true
//        AFHttp.del(url: AFHttp.API_POST_DELETE + String(post.id!), params: [:], handler: { response in
//            self.isLoading = false
//            switch response.result {
//            case .success:
//                print(response.result)
//                self.isDeleted = true
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
}
