//
//  TabBarController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/02.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift


class TabBarController: UITabBarController {
    
    var vcList: [UIViewController] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let ChatVC = SendRequestViewController()
        //        ChatVC.tabBarItem = .init(title: "相談部屋",
        //                                  image: #imageLiteral(resourceName: "sample_memo_sheet").withRenderingMode(.alwaysTemplate),
        //                                  selectedImage: #imageLiteral(resourceName: "sample_memo_sheet").withRenderingMode(.alwaysTemplate))
        ChatVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        
        let nv_ChatVC = UINavigationController(rootViewController: ChatVC)
        vcList.append(nv_ChatVC)
        
        
        
        let RecordVC = RecordViewController()
        RecordVC.tabBarItem = .init(title: "目標一覧",
                                    image: #imageLiteral(resourceName: "progressMan2").withRenderingMode(.alwaysOriginal),
                                    selectedImage: #imageLiteral(resourceName: "progressMan2").withRenderingMode(.alwaysOriginal))
        RecordVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        
        let nv_RecordVC = UINavigationController(rootViewController: RecordVC)
        vcList.append(nv_RecordVC)
        
        
        
        self.setViewControllers(self.vcList, animated: false)
        self.selectedIndex = 0
    }
    
    @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    
    func getData(){
        
        db.collection("books").addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else{
                
                print("error?.localizedDescription")
                return
            }
            
            
            self.books = documents.compactMap { (queryDocumentSnapshot) -> Book? in
                
                return try? queryDocumentSnapshot.data(as: Book.self)
            }
        }
    }
    
    
    func putData(book: Book) throws {
        
        do {
            let data = try? db.collection("books").addDocument(from: book)
        }
        catch{
            print(error)
        }
        
        
    }
}


import FirebaseFirestoreSwift


struct Book: Identifiable, Codable{
    
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var author: String
    var numberofPages: Int
    
    
    enum CodingKyes: String, CodingKey{
        
        case title
        case author
        case numberofPages = "pages"
    }
}
