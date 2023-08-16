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
    
    //Duped
    let user = Firestore.firestore().collection("Users").document(Authed_User().auth)
    
    
    let records = Firestore.firestore().collection("Users").document(Authed_User().auth).collection("Records")
    
    
    
    
    
    let users = Firestore.firestore().collection("User").document(Authed_User().auth)
    
    
    let uAttendance = Firestore.firestore().collection("User").document(Authed_User().auth).collection("Attendance")
    
    
    let uRequest = Firestore.firestore().collection("User").document(Authed_User().auth).collection("Request")
    
    
    let event = Firestore.firestore().collection("Event")//.document(Authed_User().auth)
    
    
    let product = Firestore.firestore().collection("Product")
    
    
    let munic = Firestore.firestore().collection("Munic")
}
