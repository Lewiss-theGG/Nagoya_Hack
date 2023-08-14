//
//  ProductDisplayViewController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/14.
//

import UIKit

class ProductDisplayViewController: UIViewController {
    
    let baseview = GradationView()
    
    
    let displayTable = UITableView()
    
    
    let imgs: [UIImage?] = [UIImage(named: "apple"),
                            UIImage(named: "orange"),
                            UIImage(named: "peach"),
                            UIImage(named: "apple"),
                            UIImage(named: "orange"),
                            UIImage(named: "peach"),]
    
    
    let name = ["Apple", "みかん", "Peach", "リンゴ", "Orange", "桃"]
    
    
    let ats = ["名古屋市",
               "安城市",
               "奈良市",
               "生駒市",
               "湖西市",
               "浜松市"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "参加イベント一覧"
        
        
        self.setLeft(leftBarTitle: "<")
        self.setView()
    }
    
    
    public func setView(){
        
        view.addSubview(baseview)
        baseview.frame = view.bounds
        baseview.backgroundColor = .systemBackground
        
        
        view.addSubview(displayTable)
        displayTable.delegate = self
        displayTable.dataSource = self
        displayTable.register(disPlayProductCell.self, forCellReuseIdentifier: "disPlayProductCell")
        displayTable.separatorStyle = .none
        displayTable.backgroundColor = .clear
        displayTable.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            displayTable.topAnchor.constraint(equalTo: view.safeTopAnchor),
            displayTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayTable.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            displayTable.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


extension ProductDisplayViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ats.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "disPlayProductCell", for: indexPath) as! disPlayProductCell
        
        let nilView = UIView()
        nilView.backgroundColor = .clear
        cell.backgroundView = nilView
        cell.selectedBackgroundView = nilView
        cell.backgroundColor = .clear
        cell.cellSetView()
        
        
        cell.atLabel.text = "\(ats[indexPath.row])"
        cell.priceLabel.text = "🔆 90 TMI"
        cell.productImage.image = imgs[indexPath.row]
        cell.productName.text = "\(name[indexPath.row])"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.width*0.4 + 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = ProductDetailViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: false)
        
        vc.atLabel.text = "\(ats[indexPath.row])"
        vc.priceLabel.text = "🔆 90 TMI"
        vc.productImage.image = imgs[indexPath.row]
        vc.productName.text = "\(name[indexPath.row])"
    }
}



class ProductDetailViewController: UIViewController{
    
    let baseView = GradationView()
    
    
    let atLabel = UILabel()
    
    
    let priceLabel = UILabel()
    
    
    let productImage = UIImageView()
    
    
    let productName = UILabel()
    
    
    let unitLabel = UILabel()
    var unitPrice:Float = 15
    
    
    let quantityField = UITextField()
    var quantity:Float = 0
    
    
    let totalLabel = UILabel()
    
    
    let holdLabel = UILabel()
    let holdValue:Float = 90
    
    
    let applyButton = UIButton()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "申請ページ"
        self.setLeft(leftBarTitle: "<")
        self.setView()
        
        
        view.baseColor()
    }
    
    
    func setView(){
        
        view.addSubview(baseView)
        baseView.addSubview(atLabel)
        baseView.addSubview(priceLabel)
        baseView.addSubview(productImage)
        baseView.addSubview(productName)
        view.addSubview(unitLabel)
        view.addSubview(quantityField)
        view.addSubview(totalLabel)
        view.addSubview(holdLabel)
        view.addSubview(applyButton)
        
        
        baseView.clipsToBounds = true
        baseView.curveHalfBottom(value: 10)
        baseView.setGradation(gradientStartColor: .systemTeal.withAlphaComponent(0.1))
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        
        atLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        atLabel.baseTextColor(textColor: .systemBackground)
        atLabel.baseColor(backgroundColor: .systemTeal)
        atLabel.clipsToBounds = true
        atLabel.layer.cornerRadius = 10
        atLabel.textAlignment = .center
        atLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        priceLabel.baseFont()
        priceLabel.baseTextColor(textColor: .label)
        priceLabel.baseColor(backgroundColor: .clear)
        priceLabel.textAlignment = .right
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 10
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        productName.baseFont(font: .monospacedSystemFont(ofSize: 30, weight: .semibold))
        productName.baseTextColor(textColor: .systemBackground)
        productName.clipsToBounds = true
        productName.layer.cornerRadius = 5
        productName.baseColor(backgroundColor: .label, opacity: 0.05)
        productName.textAlignment = .left
        productName.translatesAutoresizingMaskIntoConstraints = false
        
        
        unitLabel.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        unitLabel.baseTextColor(textColor: .label)
        unitLabel.baseColor(backgroundColor: .clear)
        unitLabel.textAlignment = .right
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "購入量：\(unitPrice)TMI x"
        
        
        quantityField.baseFont()
        quantityField.baseTextColor(textColor: .label)
        quantityField.baseColor(backgroundColor: .label, opacity: 0.05)
        quantityField.textAlignment = .center
        quantityField.textFieldDone()
        quantityField.placeholder = "\(0)"
        quantityField.delegate = self
        quantityField.translatesAutoresizingMaskIntoConstraints = false
        
        
        totalLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        totalLabel.baseTextColor(textColor: .label)
        totalLabel.clipsToBounds = true
        totalLabel.layer.cornerRadius = 5
        totalLabel.baseColor(backgroundColor: .label, opacity: 0.05)
        totalLabel.textAlignment = .center
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.text = "合計：\(quantity * unitPrice) TMI"
        
        
        holdLabel.baseFont(font: .monospacedSystemFont(ofSize: 18, weight: .semibold))
        holdLabel.baseTextColor(textColor: .label)
        holdLabel.clipsToBounds = true
        holdLabel.layer.cornerRadius = 5
        holdLabel.baseColor(backgroundColor: .label, opacity: 0.05)
        holdLabel.textAlignment = .center
        holdLabel.translatesAutoresizingMaskIntoConstraints = false
        holdLabel.text = "保有量：\(holdValue) TMI"
        
        
        applyButton.baseColor(backgroundColor: .systemTeal)
        applyButton.setTitle("申請する", for: .normal)
        applyButton.titleLabel?.font = .monospacedSystemFont(ofSize: 25, weight: .bold)
        applyButton.setTitleColor(.systemBackground, for: .normal)
        applyButton.layer.cornerRadius = 10
        applyButton.clipsToBounds = true
        applyButton.pressAction()
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            baseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 10),
            baseView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4, constant: 60),
            baseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99),
            
            
            atLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            atLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            atLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.4),
            atLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            priceLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: atLabel.rightAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            productImage.topAnchor.constraint(equalTo: atLabel.bottomAnchor, constant: 10),
            productImage.leftAnchor.constraint(equalTo: atLabel.leftAnchor),
            productImage.widthAnchor.constraint(equalTo: atLabel.widthAnchor),
            productImage.heightAnchor.constraint(equalTo: atLabel.widthAnchor),
            
            
            productName.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            productName.leftAnchor.constraint(equalTo: priceLabel.leftAnchor),
            productName.rightAnchor.constraint(equalTo: priceLabel.rightAnchor),
            productName.heightAnchor.constraint(equalToConstant: 40),
            
            
            unitLabel.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 20),
            unitLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            unitLabel.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.5),
            unitLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            quantityField.topAnchor.constraint(equalTo: unitLabel.topAnchor),
            quantityField.leftAnchor.constraint(equalTo: unitLabel.rightAnchor, constant: 10),
            quantityField.widthAnchor.constraint(equalToConstant: 40),
            quantityField.heightAnchor.constraint(equalToConstant: 40),
            
            
            totalLabel.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 20),
            totalLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -10),
            totalLabel.heightAnchor.constraint(equalToConstant: 40),
            totalLabel.widthAnchor.constraint(equalToConstant: 200),
            
            
            holdLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 20),
            holdLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -10),
            holdLabel.heightAnchor.constraint(equalToConstant: 40),
            holdLabel.widthAnchor.constraint(equalToConstant: 200),
            
            
            applyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -50),
            applyButton.heightAnchor.constraint(equalToConstant: 80),
            applyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
        ])
    }
}


extension ProductDetailViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if let val = Float(textField.text ?? "0"){
             
            quantity = val
            totalLabel.text = "合計：\(quantity * unitPrice) TMI"
        }
        else{
            quantity = 0
            totalLabel.text = "合計：0 TMI"
            return
        }
    }
}
