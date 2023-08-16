//
//  UserViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/13.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift


class UserViewController: UIViewController {
    
    
    let userIcon = UIImageView()
    
    
    let usernameLabel = UILabel()
    
    
    let editButton = UIButton()
    
    
    let baseView = UIView()
    
    
    let holdBaseView = GradationView()
    
    
    let attendBaseView = GradationView()
    
    
    let holdLabel = UILabel()
    
    
    let attendLabel = UILabel()
    
    
    let holdNumberLabel = UILabel()
    
    
    let attendNumberLabel = UILabel()
    
    
    let holdBottomLabel = UILabel()
    
    
    let attendBottomLabel = UILabel()
    
    
    let holdOverlay = UIButton()
    
    
    let attendOverlay = UIButton()
    
    
    @Published var user: User = User(userAttendance: Int(),
                                     userToken: Int(),
                                     userMail: String(),
                                     userName: String(),
                                     userID: String())
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        self.setView()
        
        //        do {
        //
        //            let path = UUID().uuidString
        //
        //            try putAttedndance(attendance: uAttendance(eventAt: "名古屋市",
        //                                                       eventDate: Date(),
        //                                                       eventID: path,
        //                                                       eventName: "名古屋市ごみ祭り",
        //                                                       eventReward: 5),  path: path)
        //
        //
        //            try putProduct(product: uProduct(productFrom: "名古屋市",
        //                                             productID: path,
        //                                             productImageURL: String(),
        //                                             productName: "Uiro",
        //                                             productRequestState: "done",
        //                                             productRequested: 2,
        //                                             productRequestedAt: Date(),
        //                                             productUnitPrice: 50),  path: path)
        //
        //
        //
        //        } catch {
        //
        //            print("An error occurred: \(error)")
        //        }
        
        
        
        let globalQ = DispatchQueue.global()
        globalQ.sync {
            
            getUser()
        }
    }
    
    
    
    final func getUser(){
        
        Database().users.getDocument { document, error in
            
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            if let document = document, document.exists {
                
                do {
                    
                    try self.user =  document.data(as: User.self)
                    
                    self.setView()
                    
                } catch {
                    print("Error decoding document: \(error)")
                }
                
            }
        }
    }
    
    
    final func putAttedndance(attendance: uAttendance, path: String) throws {
        
        do {
            
            try Database().uAttendance.document(path).setData(from: attendance)
        }
        catch{
            
            print(error)
        }
    }
    
    
    final func putProduct(product: uProduct, path: String) throws {
        
        do {
            
            try Database().uRequest.document(path).setData(from: product)
        }
        catch{
            
            print(error)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
                
        super.viewDidLayoutSubviews()
    }
    
    
    func setView(){
        
        
        view.addSubview(userIcon)
        view.addSubview(usernameLabel)
        view.addSubview(editButton)
        view.addSubview(baseView)
        baseView.addSubview(holdBaseView)
        
        
        baseView.addSubview(holdBaseView)
        baseView.addSubview(attendBaseView)
        
        
        holdBaseView.addSubview(holdLabel)
        holdBaseView.addSubview(holdNumberLabel)
        holdBaseView.addSubview(holdBottomLabel)
        holdBaseView.addSubview(holdOverlay)
        
        
        attendBaseView.addSubview(attendLabel)
        attendBaseView.addSubview(attendNumberLabel)
        attendBaseView.addSubview(attendBottomLabel)
        attendBaseView.addSubview(attendOverlay)
        
        
        userIcon.image = UIImage(named: "user")
        userIcon.contentMode = .scaleAspectFit
        userIcon.clipsToBounds = true
        userIcon.layer.cornerRadius = 50
        userIcon.layer.borderWidth = 1
        userIcon.layer.borderColor = UIColor.label.cgColor
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        usernameLabel.text = user.userName
        usernameLabel.text = usernameLabel.text?.uppercased()
        usernameLabel.baseFont(font: .monospacedSystemFont(ofSize: 50, weight: .bold))
        usernameLabel.baseTextColor()
        usernameLabel.baseColor(backgroundColor: .clear)
        usernameLabel.textAlignment = .center
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        editButton.setTitle("⚙️", for: .normal)
        editButton.setTitleColor(.label, for: .normal)
        editButton.titleLabel?.baseFont()
        editButton.baseColor()
        editButton.pressAction()
        editButton.baseColor(backgroundColor: .clear)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        baseView.baseColor(backgroundColor: .systemGray3, opacity: 0.01)
        baseView.shadow(width: 0, height: 2, opacity: 0.6, radius: 4)
        baseView.clipsToBounds = true
        baseView.layer.cornerRadius = 15
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        holdBaseView.setGradation(gradientStartColor: .systemTeal)
        holdBaseView.clipsToBounds = true
        holdBaseView.layer.cornerRadius = 10
        holdBaseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        attendBaseView.setGradation(gradientStartColor: .systemPink)
        attendBaseView.clipsToBounds = true
        attendBaseView.layer.cornerRadius = 10
        attendBaseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        holdLabel.text = "保有量"
        holdLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        holdLabel.baseTextColor(textColor: .secondarySystemBackground)
        holdLabel.baseColor(backgroundColor: .clear)
        holdLabel.textAlignment = .center
        holdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        attendLabel.text = "参加実績"
        attendLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        attendLabel.baseTextColor(textColor: .secondarySystemBackground)
        attendLabel.baseColor(backgroundColor: .clear)
        attendLabel.textAlignment = .center
        attendLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        holdNumberLabel.text = "\(user.userToken)"
        holdNumberLabel.baseTextColor(textColor: .systemBackground)
        holdNumberLabel.baseColor(backgroundColor: .clear)
        holdNumberLabel.baseFont(font: .monospacedSystemFont(ofSize: 100, weight: .bold))
        holdNumberLabel.textAlignment = .center
        holdNumberLabel.numberOfLines = 1
        holdNumberLabel.minimumScaleFactor = 0.4
        holdNumberLabel.adjustsFontSizeToFitWidth = true
        holdNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        attendNumberLabel.text = "\(user.userAttendance)"
        attendNumberLabel.baseTextColor(textColor: .systemBackground)
        attendNumberLabel.baseColor(backgroundColor: .clear)
        attendNumberLabel.baseFont(font: .monospacedSystemFont(ofSize: 100, weight: .bold))
        attendNumberLabel.textAlignment = .center
        attendNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        holdBottomLabel.text = "TMI"
        holdBottomLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        holdBottomLabel.baseTextColor(textColor: .systemBackground)
        holdBottomLabel.baseColor(backgroundColor: .clear)
        holdBottomLabel.textAlignment = .right
        holdBottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        attendBottomLabel.text = "カ所"
        attendBottomLabel.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        attendBottomLabel.baseTextColor(textColor: .systemBackground)
        attendBottomLabel.baseColor(backgroundColor: .clear)
        attendBottomLabel.textAlignment = .right
        attendBottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        holdOverlay.baseColor(backgroundColor: .clear)
        holdOverlay.pressAction()
        holdOverlay.addTarget(self, action: #selector(holdPresent), for: .touchUpInside)
        holdOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        
        attendOverlay.baseColor(backgroundColor: .clear)
        attendOverlay.pressAction()
        attendOverlay.addTarget(self, action: #selector(attendPresent), for: .touchUpInside)
        attendOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        
        let mlt: CGFloat = 0.85
        
        let bvM: CGFloat = 0.3
        
        
        NSLayoutConstraint.activate([
        
            userIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userIcon.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 50),
            userIcon.heightAnchor.constraint(equalToConstant: 100),
            userIcon.widthAnchor.constraint(equalToConstant: 100),
            
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 50),
            usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            
            editButton.topAnchor.constraint(equalTo: userIcon.topAnchor),
            editButton.leftAnchor.constraint(equalTo: userIcon.rightAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            baseView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 50),
            baseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: mlt),
            baseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: bvM),
            
            
            holdBaseView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            holdBaseView.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.9),
            holdBaseView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.45),
            holdBaseView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: view.width*mlt*0.025),
            
            
            attendBaseView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            attendBaseView.heightAnchor.constraint(equalTo: baseView.heightAnchor, multiplier: 0.9),
            attendBaseView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.45),
            attendBaseView.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -view.width*mlt*0.025),
            
            
            holdLabel.centerXAnchor.constraint(equalTo: holdBaseView.centerXAnchor),
            holdLabel.topAnchor.constraint(equalTo: holdBaseView.topAnchor, constant: 10),
            holdLabel.heightAnchor.constraint(equalTo: holdBaseView.heightAnchor, multiplier: 0.15),
            holdLabel.widthAnchor.constraint(equalTo: holdBaseView.widthAnchor),
            
            
            attendLabel.centerXAnchor.constraint(equalTo: attendBaseView.centerXAnchor),
            attendLabel.topAnchor.constraint(equalTo: attendBaseView.topAnchor, constant: 10),
            attendLabel.heightAnchor.constraint(equalTo: attendBaseView.heightAnchor, multiplier: 0.15),
            attendLabel.widthAnchor.constraint(equalTo: attendBaseView.widthAnchor),
            
            
            holdBottomLabel.centerXAnchor.constraint(equalTo: holdBaseView.centerXAnchor),
            holdBottomLabel.bottomAnchor.constraint(equalTo: holdBaseView.bottomAnchor, constant: -10),
            holdBottomLabel.heightAnchor.constraint(equalTo: holdBaseView.heightAnchor, multiplier: 0.15),
            holdBottomLabel.widthAnchor.constraint(equalTo: holdBaseView.widthAnchor),
            
            
            attendBottomLabel.centerXAnchor.constraint(equalTo: attendBaseView.centerXAnchor),
            attendBottomLabel.bottomAnchor.constraint(equalTo: attendBaseView.bottomAnchor, constant: -10),
            attendBottomLabel.heightAnchor.constraint(equalTo: attendBaseView.heightAnchor, multiplier: 0.15),
            attendBottomLabel.widthAnchor.constraint(equalTo: attendBaseView.widthAnchor),
            
            
            holdNumberLabel.centerXAnchor.constraint(equalTo: holdBaseView.centerXAnchor),
            holdNumberLabel.topAnchor.constraint(equalTo: holdLabel.bottomAnchor, constant: 10),
            holdNumberLabel.bottomAnchor.constraint(equalTo: holdBottomLabel.topAnchor, constant: -10),
            holdNumberLabel.widthAnchor.constraint(equalTo: holdBaseView.widthAnchor, constant: -10),
            
            
            attendNumberLabel.centerXAnchor.constraint(equalTo: attendBaseView.centerXAnchor),
            attendNumberLabel.topAnchor.constraint(equalTo: attendLabel.bottomAnchor, constant: 10),
            attendNumberLabel.bottomAnchor.constraint(equalTo: attendBottomLabel.topAnchor, constant: -10),
            attendNumberLabel.widthAnchor.constraint(equalTo: attendBaseView.widthAnchor, constant: -10),
            
            
            holdOverlay.centerYAnchor.constraint(equalTo: holdBaseView.centerYAnchor),
            holdOverlay.heightAnchor.constraint(equalTo: holdBaseView.heightAnchor),
            holdOverlay.widthAnchor.constraint(equalTo: holdBaseView.widthAnchor),
            holdOverlay.centerXAnchor.constraint(equalTo: holdBaseView.centerXAnchor),
            
            
            attendOverlay.centerYAnchor.constraint(equalTo: attendBaseView.centerYAnchor),
            attendOverlay.heightAnchor.constraint(equalTo: attendBaseView.heightAnchor),
            attendOverlay.widthAnchor.constraint(equalTo: attendBaseView.widthAnchor),
            attendOverlay.centerXAnchor.constraint(equalTo: attendBaseView.centerXAnchor),
        ])
    }
    
    
    @objc func holdPresent(){
        
        let vc = ProductDisplayViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        self.present(nvc, animated: false)
    }
    
    
    @objc func attendPresent(){
        
        let vc = AttendDisplayViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        self.present(nvc, animated: false)
    }
}







struct User: Identifiable, Codable{

    @DocumentID var id: String? = UUID().uuidString

    var userAttendance: Int
    var userToken: Int
    var userMail: String
    var userName: String
    var userID: String
}





struct uAttendance: Identifiable, Codable{

    @DocumentID var id: String? = UUID().uuidString


    var eventAt: String
    var eventDate: Date
    var eventID: String
    var eventName: String
    var eventReward: Int
}



struct uProduct: Identifiable, Codable{
    
    @DocumentID var id: String? = UUID().uuidString
    
    
    var productFrom: String
    var productID: String
    var productImageURL: String
    var productName: String
    var productRequestState: String
    var productRequested: Int
    var productRequestedAt: Date
    var productUnitPrice: Int
}

//
//
//struct Response: Codable{
//
//    var todo : [String]
//    var detail : [String]
//    var map : [String]
//
//
//    enum CodingKeys: String, CodingKey {
//        case todo = "やるべき事"
//        case detail = "具体的なアドバイス"
//        case map = "ロードマップ"
//    }
//}



