//
//  Firebase_Struct.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/04.
//

import Foundation
import Firebase
import FirebaseAuth


struct Authed_User{
    
    let auth = Auth.auth().currentUser!.uid
}


struct Database{
    
    let user = Firestore.firestore().collection("Users").document(Authed_User().auth)
    
    
    let records = Firestore.firestore().collection("Users").document(Authed_User().auth).collection("Records")
}
