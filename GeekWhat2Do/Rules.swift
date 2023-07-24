//
//  Rules.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/07/23.
//



import UIKit


//ビューのサイズに関する設定の簡略化
extension UIView {
    
    public var width: CGFloat {
        
        return frame.size.width
    }
    
    
    public var height: CGFloat {
        
        return frame.size.height
    }
    
    
    public var top: CGFloat {
        
        return frame.origin.y
    }
    
    
    public var bottom: CGFloat {
        
        return top + height
    }
    
    
    public var left: CGFloat {
        
        return frame.origin.x
    }
    
    
    public var right: CGFloat {
        
        return left + width
    }
    
    
    public var safeTop: CGFloat {
        
        return safeAreaInsets.top
    }
    
    
    public var safeBottom: CGFloat {
        
        return safeAreaInsets.bottom
    }
    
    
    public var safetyHeight: CGFloat {
        
        return height - (safeBottom + safeTop)
    }
    
    
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        
        return safeAreaLayoutGuide.topAnchor
    }
    
    
    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    
    public var safeHeightAnchor: NSLayoutDimension {
        
        return safeAreaLayoutGuide.heightAnchor
    }
    
    
    public var radius: CGFloat {
        
        return layer.cornerRadius
    }
    
    
    /**
     A variable that defines the univarsal  color
     */
    public func baseColor(backgroundColor: UIColor = .systemBackground){
        
        self.backgroundColor = backgroundColor
    }
    
    
    public func curveHalfTop(value: CGFloat){
        
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    public func curveHalfBottom(value: CGFloat){
        
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    
    public func curveTip(value: CGFloat){
        
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMinXMinYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMaxXMaxYCorner,
                                    .layerMinXMaxYCorner]
    }
}



extension UITextView{
    
    /**
     A variable that defines the univarsal  color
     */
    public func baseFont(font: UIFont = .monospacedSystemFont(ofSize: 18, weight: .regular)){
        
        self.font = font
    }
    
    
    /**
     A variable that defines a text color
     */
    public func baseTextColor(textColor: UIColor = .label){
        
        self.textColor = textColor
    }
}



extension UITextField{
    
    /**
     A variable that defines the univarsal  color
     */
    public func baseFont(font: UIFont = .monospacedSystemFont(ofSize: 18, weight: .regular)){
        
        self.font = font
    }
    
    
    /**
     A variable that defines a text color
     */
    public func baseTextColor(textColor: UIColor = .label){
        
        self.textColor = textColor
    }
}



extension UILabel{
    
    /**
     A variable that defines the univarsal  color
     */
    public func baseFont(font: UIFont = .monospacedSystemFont(ofSize: 18, weight: .regular)){
        
        self.font = font
    }
    
    
    /**
     A variable that defines a text color
     */
    public func baseTextColor(textColor: UIColor = .label){
        
        self.textColor = textColor
    }
}



extension UIViewController{
    
    public func setLeft(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "＜　完了", style: .done,target: self, action: #selector(showValue))
    }
    
    
    @objc func showValue(){
        
        self.dismiss(animated: true, completion: nil)
    }
}



struct NavBarConst_m {
    
    /// ナビゲーションバーの左端からのマージン
    static let ImageLeftMargin: CGFloat = -16
    
    
    /// ナビゲーションバーの底からのマージン
    static let ImageBottomMargin: CGFloat = 6
    
    
    /// ナビゲーションバー内のイメージサイズ
    static let ImageSize: CGFloat = 36
    
    
    
    static func icon_set(image: UIImage, curve: Bool = true) -> UIButton{
        
        let imageView = UIButton()
        imageView.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        if curve == true{
            
            imageView.layer.cornerRadius = NavBarConst_m.ImageSize / 2
            imageView.clipsToBounds = true
        }
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }
    
    /// ナビゲーションバーの高さ
    //static let NavBarHeight: CGFloat = 44
}



extension UIButton{
        
    public func pressAction(off: Bool = false){
        
        if off == true{
            
            return
        }
        
        
        self.addTarget(self, action: #selector(self.pushButton_Animation(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(self.separateButton_Animation(_:)), for: .touchUpInside)
    }
    
    
    @objc func pushButton_Animation(_ sender: UIButton){
        
        UIView.animate(withDuration: 0.1, animations:{ () -> Void in
            
            sender.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            sender.alpha = 0.8
        })
    }
    
    
    @objc func separateButton_Animation(_ sender: UIButton){
        
        UIView.animate(withDuration: 0.2, animations:{ () -> Void in
            
            sender.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            sender.alpha = 1
        })
    }
}



extension UITextField{
    
    func textFieldDone(){
        
        // ツールバー生成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.width, height: 40))
        
        // スタイルを設定
        toolBar.barStyle = UIBarStyle.default
        
        // 画面幅に合わせてサイズを変更
        toolBar.sizeToFit()
        
        // 閉じるボタンを右に配置するためのスペース?
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped(view:)))
        
        // スペース、閉じるボタンを右側に配置
        toolBar.items = [spacer, commitButton]
        
        // textViewのキーボードにツールバーを設定
        self.inputAccessoryView = toolBar
    }
    
    @objc func commitButtonTapped(view: UIView) {
        
        superview?.endEditing(true)
    }
}
