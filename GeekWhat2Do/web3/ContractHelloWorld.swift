//
//  ContractHelloWorld.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/17.
//

import Foundation
import UIKit
import BigInt
import web3swift
import Web3Core


class web3ViewController: UIViewController{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        Task {
            
            await self.getBalance()
        }
    }
    
    
    func comand4Keys(){
        
        
    }
    
    
    func getBalance() async {
        
        //ファイル名生成
        let generationFileName = "WalletAccount"
        // keystore ファイルを保存するディレクトリのパスを取得
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        var keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore", scanForHDwallets: true)
        
        // パスワードを使用する
        let password = "1234567890"
        //KeyStoreの生成ファイルを作成
        let keystore = try! EthereumKeystoreV3(password: password)!
        //生成ファイルをエンコード
        let keyData = try! JSONEncoder().encode(keystore.keystoreParams)
        //アドレス取得
        let address = keystore.addresses!.first!.address
        //ファイル書き込み処理
        FileManager.default.createFile(atPath: userDir + "/keystore"+"/\(generationFileName).json", contents: keyData, attributes: nil)
        keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore", scanForHDwallets: true)
        print("アカウント：\(address)")
        print(keystoreManager ?? "1212121212121アカウント2121212121アカウント212oufbgeiugbntp4ijgnojr3pngアカウント9ungu93rn9gアカウントu53nugn5iu4ngi5nihgnu5bg5ngui5ngun8")
        
        //ファイルパス参照
        if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first {
            let path_file_name = dir.appendingPathComponent( "keystore/WalletAccount.json" )
            
            do {
                let keystore = try String( contentsOf: path_file_name, encoding: String.Encoding.utf8 )
                //キーストアの設定
                let data = keystore
                
                
                guard let keystoreSetting = EthereumKeystoreV3(data) else{
                    
                    print("鍵がねーよバカ！！")
                    return
                }
                
                keystoreManager = KeystoreManager([keystoreSetting])
                //本番サーバに接続
                let web3 = try? await Web3.InfuraMainnetWeb3()
                
                
                Task {
                    web3?.addKeystoreManager(keystoreManager)
                    
                    //残高取得処理
                    let walletAddress = EthereumAddress(address)! // Address which balance we want to know
                    do{
                        let balanceResult = try await web3?.eth.getBalance(for: walletAddress)
                        
                        //let eth = Web3.Utils.Units(Web3.Eth)
                        
                        //we Web3.Utils.Units.Microether

                        //let balanceString = Web3.Utils.Units.Microether
                        
                        print("残高：\(balanceResult ?? "ねーよバカ")")
                    }
                    catch{
                        print("エラー：\(error)")
                    }
                }
                
            } catch {
                //エラー処理
                print("ファイルない")
            }
        }
        
    }
}
