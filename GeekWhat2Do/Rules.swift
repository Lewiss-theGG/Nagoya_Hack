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
    public func baseColor(backgroundColor: UIColor = .systemBackground, opacity: CGFloat = 1){
        
        if backgroundColor == .clear{
            
            self.backgroundColor = backgroundColor.withAlphaComponent(0)
            return
        }
        
        
        self.backgroundColor = backgroundColor.withAlphaComponent(opacity)
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
    
    public func setLeft(leftBarTitle : String = "＜　完了"){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "\(leftBarTitle)", style: .done,target: self, action: #selector(showValue))
    }
    
    
    @objc func showValue(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setTabBar(){
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor =  UIColor.secondarySystemBackground
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
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





extension UIView {
    
    func parentViewController() -> UIViewController? {
        
        var parentResponder: UIResponder? = self
        
        while true {
            
            guard let nextResponder = parentResponder?.next else { return nil }
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
            parentResponder = nextResponder
        }
    }
    
    func parentView<T: UIView>(type: T.Type) -> T? {
        
        var parentResponder: UIResponder? = self
        
        while true {
            
            guard let nextResponder = parentResponder?.next else { return nil }
            
            if let view = nextResponder as? T {
                
                return view
            }
            
            parentResponder = nextResponder
        }
    }
}




extension UIView{
    
    public func shadow(width: CGFloat, height: CGFloat, opacity: Float, radius: CGFloat, color: CGColor = UIColor.black.cgColor){
        
        if self.backgroundColor == UIColor.clear{
            return
        }
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    public func removeShadow(){
        
        shadow(width: 0, height: 0, opacity: 0, radius: 0, color: UIColor.clear.cgColor)
    }
    
    
    public func setSealing_(target: UIView, hgt: CGFloat, color: CGColor){
        
        //下線のCALayerを作成
        let underLine = CALayer()
        underLine.frame = CGRect(x: 0, y: 0, width: target.width, height: hgt)
        underLine.backgroundColor = color
        
        //作成したViewに上線を追加
        target.layer.addSublayer(underLine)
    }
    
    
    public func setUnderLine_(target: UIView, hgt: CGFloat, color: CGColor){
        
        //下線のCALayerを作成
        let underLine = CALayer()
        underLine.frame = CGRect(x: 0, y: target.bottom - hgt*2, width: target.width, height: hgt)
        underLine.backgroundColor = color
        
        //作成したViewに上線を追加
        target.layer.addSublayer(underLine)
    }
    
}

extension UITextField{
    
    func def_textFieldDone(targetView: UITextField, view: UIView){
        // ツールバー生成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.width, height: 40))
        
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
        targetView.inputAccessoryView = toolBar
    }
}



extension UITextView{
    
    
    func def_textViewDone(targetView: UITextView, view: UIView){
        // ツールバー生成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.width, height: 40))
        
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
        targetView.inputAccessoryView = toolBar
    }
    
    
    @objc func commitButtonTapped(view: UIView) {
        
        superview?.endEditing(true)
    }
}



extension UITextView {
    
    func splitTextsAtCursor() -> (left: String, right: String)? {
        guard let currentRange = self.selectedTextRange else {
            return nil
        }

        let currentPosition = currentRange.start
        guard let leftRange = self.textRange(from: self.beginningOfDocument, to: currentPosition), let leftText = self.text(in: leftRange) else {
            return nil
        }

        guard let rightRange = self.textRange(from: currentPosition, to: self.endOfDocument), let rightText = self.text(in: rightRange) else {
            return nil
        }

        return (left: leftText, right: rightText)
    }
}

extension UIAlertController {
    
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }
    
    //Set title font and title color
    func setTitlet(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        
        let attributeString = NSMutableAttributedString(string: title)//1
        
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont],//2
                                          range: NSMakeRange(0, title.utf8.count))
        }
        
        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
                                          range: NSMakeRange(0, title.utf8.count))
        }
        
        self.setValue(attributeString, forKey: "attributedTitle")//4
    }
    
    //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        
        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }
    
    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}
