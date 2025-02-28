# iOS Development Assignment#2
## Memory Management, Collections Performance, and Protocol Implementation

### Overview
In this assignment, you will work with memory management concepts and performance optimization by implementing a social media feed application. You'll need to identify appropriate places for memory management, choose correct collections, and implement required protocols.

### Learning Objectives
- Implement proper memory management using ARC
- Identify places where weak/unowned references are needed
- Fix memory leaks and retain cycles
- Make informed decisions about collection types
- Implement Hashable and Equatable protocols

### Part 1: Memory Management Implementation

#### Task 1.1: Profile Management System
Implement the following classes while ensuring proper memory management:

```swift
protocol ProfileUpdateDelegate: AnyObject{
    // TODO: Consider protocol inheritance requirements
    // Think: When should we restrict protocol to reference types only?
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}

class ProfileManager {
    // Using a dictionary for fast lookup of active profiles
    private var activeProfiles: [String: UserProfile] = [:]

    // Using `weak` to prevent retain cycle
    weak var delegate: ProfileUpdateDelegate?

    // Closure for profile updates; must be weakly captured
    var onProfileUpdate: ((UserProfile) -> Void)?

    init(delegate: ProfileUpdateDelegate?) {
        self.delegate = delegate
    }

    
    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
    fetchProfileFromServer(id: id) { [weak self] result in
        guard let self = self else { return } // Prevent using `self` if it's nil
        switch result {
        case .success(let profile):
            self.activeProfiles[id] = profile
            self.delegate?.profileDidUpdate(profile)
            self.onProfileUpdate?(profile)
            completion(.success(profile))
        case .failure(let error):
            self.delegate?.profileLoadingError(error)
            completion(.failure(error))
        }
    }
}

}

class UserProfileViewController: ProfileUpdateDelegate {
    // `ProfileManager` should be strongly held by the view controller
    var profileManager: ProfileManager?
    
    // `ImageLoader` should be strongly held as well
    var imageLoader: ImageLoader?

    func setupProfileManager() {
        profileManager = ProfileManager(delegate: self)

        // Capture `self` weakly in closure to prevent retain cycle
        profileManager?.onProfileUpdate = { [weak self] profile in
            self?.handleProfileUpdate(profile)
        }
    }

    func updateProfile() {
        profileManager?.loadProfile(id: "123") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let profile):
                self.handleProfileUpdate(profile)
            case .failure(let error):
                print("Failed to load profile: \(error)")
            }
        }
    }
```

#### Task 1.2: Image Loading System
Identify and fix potential retain cycles in this system:

```swift
protocol ImageLoaderDelegate {
    // TODO: Think about protocol requirements
    // Consider: What types can conform to this protocol?
    // Consider: How does this affect memory management?
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage)
    func imageLoader(_ loader: ImageLoader, didFailWith error: Error)
}

class ImageLoader {
    // TODO: Consider reference type for delegate
    var delegate: ImageLoaderDelegate?
    
    // TODO: Think about closure reference type
    var completionHandler: ((UIImage?) -> Void)?
    
    func loadImage(url: URL) {
        // TODO: Implement image loading
        // Consider: How to avoid retain cycle?
    }
}

class PostView {
    // TODO: Consider reference management
    var imageLoader: ImageLoader?
    
    func setupImageLoader() {
        // TODO: Implement setup
        // Think: What reference types should be used?
    }
}
```

### Part 2: Collections Optimization

#### Task 2.1: Feed System Implementation
Choose and implement appropriate collections for these scenarios:

```swift
class FeedSystem {
    // TODO: Implement cache storage
    // Consider: Which collection type is best for fast lookup?
    // Requirements: O(1) access time, storing UserProfile objects with UserID keys
    private var userCache: [String: UserProfile] = [:]

    
    // TODO: Implement feed storage
    // Consider: Which collection type is best for ordered data?
    // Requirements: Maintain post order, frequent insertions at the beginning
    private var feedPosts: [Post] = []
    
    // TODO: Implement hashtag storage
    // Consider: Which collection type is best for unique values?
    // Requirements: Fast lookup, no duplicates
    private var hashtags: Set<String> = []

    
    func addPost(_ post: Post) {
        // TODO: Implement post addition
        // Consider: Which collection operations are most efficient?
        feedPost.insert(post, at:0)
    }
    
    func removePost(_ post: Post) {
        // TODO: Implement post removal
        // Consider: Performance implications of removal
        if let index == feedPost.firstIndex(where:{$0.id == post.id})
    }
}
```

### Part 3: Hashable and Equatable Implementation

```swift
struct UserProfile: Hashable {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int
    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    // Remember: Only use immutable properties
    static func== (lhs :Userprofile, rhs: Userprofile) -> Bool{
        return lhs.id = rhs.id
    }
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }

    
    // TODO: Implement Equatable
    // Consider: Which properties determine equality?
}

struct Post {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int
    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }

    
    // TODO: Implement Equatable
    // Consider: When should two posts be considered equal?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
```

### Requirements for Implementation

For each TODO in the code:
1. Analyze potential retain cycles
2. Determine appropriate reference types (weak, unowned, strong)
3. Choose correct collection types based on usage patterns
4. Implement protocol requirements
5. Add comments explaining your decisions

### Grading Criteria

- Correct memory management
- Proper collection choice with justification
- Protocol implementation correctness
- Code quality and documentation

### Submission Requirements

1. Complete implementation of all TODO items
2. Unit tests demonstrating functionality
3. Documentation explaining:
   - Memory management decisions
   - Collection type choices
   - Protocol implementation decisions

Good luck with your implementation!