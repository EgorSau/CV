//
//  ViewController.swift
//  video
//
//  Created by Egor SAUSHKIN on 04.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timerText: Int = 100
    var timer: Timer?
    let gameStartedColor = UIColor(red: 1, green: 0, blue: 0.349, alpha: 1)
    
    let panGestureRecognizer = UIPanGestureRecognizer()
    var buttonCenterX: NSLayoutConstraint?
    var buttonCenterY: NSLayoutConstraint?
    var handCenterX: NSLayoutConstraint?
    var handCenterY: NSLayoutConstraint?
    var panGesturePoint: CGPoint?
    
    let button = Button()
    
    var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    var rightTimer: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "OpenSans-Regular", size: 12)
        return label
    }()
    
    var leftTimer: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont(name: "OpenSans-Regular", size: 12)
        return label
    }()
    
    
    var rightVector1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-1")
        return image
    }()
    
    var rightVector2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-9")
        return image
    }()
    
    var leftVector1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-2")
        return image
    }()
    
    var leftVector2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-3")
        return image
    }()
    
    var rightVector1ForTimer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-1")?.withTintColor(UIColor(red: 1, green: 0, blue: 0.349, alpha: 1))
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    var rightVector2ForTimer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-9")?.withTintColor(UIColor(red: 1, green: 0, blue: 0.349, alpha: 1))
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    var leftVector1ForTimer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-2")?.withTintColor(UIColor(red: 1, green: 0, blue: 0.349, alpha: 1))
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    var leftVector2ForTimer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-3")?.withTintColor(UIColor(red: 1, green: 0, blue: 0.349, alpha: 1))
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    var centerHand: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-4")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundSetup()
        self.rightVector1Setup()
        self.rightVector2Setup()
        self.leftVector1Setup()
        self.leftVector2Setup()
        self.leftTimerSetup()
        self.rightTimerSetup()
        self.buttonSetup()
        self.handSetup()
        self.startGame()
        self.rightVector1ForTimerSetup()
        self.rightVector2ForTimerSetup()
        self.leftVector1ForTimerSetup()
        self.leftVector2ForTimerSetup()
        self.setupHandGesture()
    }
    
    func backgroundSetup(){
        let image0 = UIImage(named: "starship")?.cgImage
        let layer0 = CALayer()
        
        layer0.contents = image0
        layer0.bounds = view.bounds
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        view.alpha = 0.8
        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        self.view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.frame = view.frame
    }
    
    func rightVector1Setup(){
        self.view.addSubview(rightVector1)
        rightVector1.translatesAutoresizingMaskIntoConstraints = false
        rightVector1.widthAnchor.constraint(equalToConstant: 36.06).isActive = true
        rightVector1.heightAnchor.constraint(equalToConstant: 274.49).isActive = true
        rightVector1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25.06).isActive = true
        rightVector1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 51).isActive = true
    }
    
    func rightVector2Setup(){
        self.view.addSubview(rightVector2)
        rightVector2.translatesAutoresizingMaskIntoConstraints = false
        rightVector2.widthAnchor.constraint(equalToConstant: 31.71).isActive = true
        rightVector2.heightAnchor.constraint(equalToConstant: 278.5).isActive = true
        rightVector2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21.27).isActive = true
        rightVector2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48.5).isActive = true
    }
    
    func leftVector1Setup(){
        self.view.addSubview(leftVector1)
        leftVector1.translatesAutoresizingMaskIntoConstraints = false
        leftVector1.widthAnchor.constraint(equalToConstant: 28.94).isActive = true
        leftVector1.heightAnchor.constraint(equalToConstant: 274.49).isActive = true
        leftVector1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24.06).isActive = true
        leftVector1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50.01).isActive = true
    }
    
    func leftVector2Setup(){
        self.view.addSubview(leftVector2)
        leftVector2.translatesAutoresizingMaskIntoConstraints = false
        leftVector2.widthAnchor.constraint(equalToConstant: 25.45).isActive = true
        leftVector2.heightAnchor.constraint(equalToConstant: 278.5).isActive = true
        leftVector2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 21.02).isActive = true
        leftVector2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 47.5).isActive = true
    }
    
    func handSetup(){
        self.view.addSubview(centerHand)
        centerHand.translatesAutoresizingMaskIntoConstraints = false
        centerHand.widthAnchor.constraint(equalToConstant: 28.89).isActive = true
        centerHand.heightAnchor.constraint(equalToConstant: 36.27).isActive = true
        self.handCenterX = centerHand.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.handCenterY = centerHand.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        NSLayoutConstraint.activate([self.handCenterX,
                                     self.handCenterY].compactMap({$0}))
    }
    
    func rightTimerSetup(){
        self.view.addSubview(rightTimer)
        let text = String(self.timerText)
        rightTimer.text = text
        rightTimer.translatesAutoresizingMaskIntoConstraints = false
        rightTimer.widthAnchor.constraint(equalToConstant: 34).isActive = true
        rightTimer.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rightTimer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -48).isActive = true
        rightTimer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180).isActive = true
    }
    
    func leftTimerSetup(){
        self.view.addSubview(leftTimer)
        let text = String(self.timerText)
        leftTimer.text = text
        leftTimer.translatesAutoresizingMaskIntoConstraints = false
        leftTimer.widthAnchor.constraint(equalToConstant: 34).isActive = true
        leftTimer.heightAnchor.constraint(equalToConstant: 16).isActive = true
        leftTimer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 48).isActive = true
        leftTimer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 179).isActive = true
    }
    
    func buttonSetup(){
        self.view.addSubview(button)
//        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 84).isActive = true
        button.heightAnchor.constraint(equalToConstant: 88).isActive = true
        self.buttonCenterX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.buttonCenterY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        NSLayoutConstraint.activate([self.buttonCenterX,
                                     self.buttonCenterY].compactMap({$0}))
    }
    
    func startGame(){
        print("Game started")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdater), userInfo: .none, repeats: true)
        self.vectorsColorChangeAnimated()
    }
    
    @objc func timerUpdater(){
        self.timerText -= 1
        self.buttonRandomLocation()
        let text = String(self.timerText)
        self.leftTimer.text = text
        self.rightTimer.text = text
        self.leftTimer.textColor = self.gameStartedColor
        self.rightTimer.textColor = self.gameStartedColor
        if self.timerText == 0 {
            self.alertGameOver()
            self.timer?.invalidate()
            print("Game stopped")
            self.rightVector1ForTimer.isHidden = true
            self.rightVector2ForTimer.isHidden = true
            self.leftVector1ForTimer.isHidden = true
            self.leftVector2ForTimer.isHidden = true
            self.rightVector1ForTimer.alpha = 0
            self.rightVector2ForTimer.alpha = 0
            self.leftVector1ForTimer.alpha = 0
            self.leftVector2ForTimer.alpha = 0
        }
    }
    
    func alertGameOver(){
        let alert = UIAlertController(title: "Game over", message: "Do you want to try again?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "YES", style: .default) { _ in
            self.timerText = 100
            let text = String(self.timerText)
            self.leftTimer.text = text
            self.rightTimer.text = text
            self.leftTimer.textColor = .white
            self.rightTimer.textColor = .white
            self.startGame()
        }
        let action2 = UIAlertAction(title: "NO", style: .default)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: .none)
    }
    
    func rightVector1ForTimerSetup(){
        self.view.addSubview(rightVector1ForTimer)
        rightVector1ForTimer.translatesAutoresizingMaskIntoConstraints = false
        rightVector1ForTimer.widthAnchor.constraint(equalToConstant: 36.06).isActive = true
        rightVector1ForTimer.heightAnchor.constraint(equalToConstant: 274.49).isActive = true
        rightVector1ForTimer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25.06).isActive = true
        rightVector1ForTimer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 51).isActive = true
    }
    
    func rightVector2ForTimerSetup(){
        self.view.addSubview(rightVector2ForTimer)
        rightVector2ForTimer.translatesAutoresizingMaskIntoConstraints = false
        rightVector2ForTimer.widthAnchor.constraint(equalToConstant: 31.71).isActive = true
        rightVector2ForTimer.heightAnchor.constraint(equalToConstant: 278.5).isActive = true
        rightVector2ForTimer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21.27).isActive = true
        rightVector2ForTimer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48.5).isActive = true
    }
    
    func leftVector1ForTimerSetup(){
        self.view.addSubview(leftVector1ForTimer)
        leftVector1ForTimer.translatesAutoresizingMaskIntoConstraints = false
        leftVector1ForTimer.widthAnchor.constraint(equalToConstant: 28.94).isActive = true
        leftVector1ForTimer.heightAnchor.constraint(equalToConstant: 274.49).isActive = true
        leftVector1ForTimer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24.06).isActive = true
        leftVector1ForTimer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50.01).isActive = true
    }
    
    func leftVector2ForTimerSetup(){
        self.view.addSubview(leftVector2ForTimer)
        leftVector2ForTimer.translatesAutoresizingMaskIntoConstraints = false
        leftVector2ForTimer.widthAnchor.constraint(equalToConstant: 25.45).isActive = true
        leftVector2ForTimer.heightAnchor.constraint(equalToConstant: 278.5).isActive = true
        leftVector2ForTimer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 21.02).isActive = true
        leftVector2ForTimer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 47.5).isActive = true
    }
    
    func vectorsColorChangeAnimated(){
        UIView.animate(withDuration: 30.0, delay: 0, animations: {
            self.rightVector1ForTimer.isHidden = false
            self.rightVector1ForTimer.alpha = 1.0
            
            self.rightVector2ForTimer.isHidden = false
            self.rightVector2ForTimer.alpha = 1.0

            self.leftVector1ForTimer.isHidden = false
            self.leftVector1ForTimer.alpha = 1.0

            self.leftVector2ForTimer.isHidden = false
            self.leftVector2ForTimer.alpha = 1.0
        })
    }
    
    func setupHandGesture(){
        self.panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer){
        guard self.panGestureRecognizer === gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            self.panGesturePoint = gestureRecognizer.location(in: self.view)
        case .ended, .cancelled:
            self.panGesturePoint = nil
        case .changed:
            guard let panGesturePoint = panGesturePoint else { return }
            let gesturePoint = gestureRecognizer.location(in: self.view)
            self.panGesturePoint = gesturePoint
            
            self.handCenterX?.constant += gesturePoint.x - panGesturePoint.x
            self.handCenterY?.constant += gesturePoint.y - panGesturePoint.y
            guard let coordinateX = self.handCenterX?.constant else { return }
            guard let coordinateY = self.handCenterY?.constant else { return }
            self.youWin(coordinateX: coordinateX, coordinateY: coordinateY)
        default:
            break
        }
    }
    
    func youWin(coordinateX handX: CGFloat, coordinateY handY: CGFloat){
        
        guard let buttonX = self.buttonCenterX?.constant else { return }
        guard let buttonY = self.buttonCenterY?.constant else { return }
        
        let hx = Int(handX)
        let hy = Int(handY)
        let bx = Int(buttonX)
        let by = Int(buttonY)
        
        if hx == bx && hy == by {
            present(WinnerViewController(), animated: true)
            self.timer?.invalidate()
            print("Game stopped")
        }
    }
    
    func buttonRandomLocation(){
        let switcherX = Bool.random()
        let switcherY = Bool.random()
        
        let newPointX = CGFloat.random(in: 0..<100)
        let newPointY = CGFloat.random(in: 0..<50)
        
        //MARK: X
        let minX = -self.leftTimer.frame.maxX
        let maxX = self.rightTimer.frame.maxX
        let zoneForButton = maxX - minX
        let buttonLeftBorder = -zoneForButton / 4
        let buttonRightBorder = zoneForButton / 4
        
        //MARK: Y
        let minY = -self.view.frame.maxY
        let maxY = self.view.frame.maxY
        let buttonTopBorder = minY / 3
        let buttonBottomBorder = maxY / 3

        UIView.animate(withDuration: 0.1, delay: 0, animations: {
            guard let buttonX = self.buttonCenterX?.constant else { return }
            guard let buttonY = self.buttonCenterY?.constant else { return }
            var coordinate = (buttonX, buttonY)
            
            let switcher = (switcherX, switcherY)
            
            switch switcher {
            case (true, true):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant -= newPointY
                coordinate = (buttonX, buttonY)
                self.view.layoutIfNeeded()
            case (true, false):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant += newPointY
                coordinate = (buttonX, buttonY)
                self.view.layoutIfNeeded()
            case (false,false):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant -= newPointY
                coordinate = (buttonX, buttonY)
                self.view.layoutIfNeeded()
            case (false, true):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant += newPointY
                coordinate = (buttonX, buttonY)
                self.view.layoutIfNeeded()
            }
            guard coordinate != (0, 0) else { return }
            
//            print(coordinate)
            
            switch coordinate {
            case (-500...buttonLeftBorder, _):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("1")
            case (-500...buttonLeftBorder, buttonBottomBorder...250):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant -= newPointY
                self.view.layoutIfNeeded()
//                print("2")
            case (-500...buttonLeftBorder, -250...buttonTopBorder):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("3")
            case (-500...buttonLeftBorder, _):
                self.buttonCenterX?.constant += newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("4")
            case (_, buttonBottomBorder...250):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant -= newPointY
                self.view.layoutIfNeeded()
//                print("5")
            case (_, -250...buttonTopBorder):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("6")
            case (buttonRightBorder...500, _):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("7")
            case (buttonRightBorder...500, _):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant -= newPointY
                self.view.layoutIfNeeded()
//                print("8")
            case (buttonRightBorder...500, buttonBottomBorder...250):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant -= newPointY
                self.view.layoutIfNeeded()
//                print("9")
            case (buttonRightBorder...500, -250...buttonTopBorder):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("10")
            case (_, -250...buttonTopBorder):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant += newPointY
                self.view.layoutIfNeeded()
//                print("11")
            case (_, buttonBottomBorder...250):
                self.buttonCenterX?.constant -= newPointX
                self.buttonCenterY?.constant -= newPointY
                self.view.layoutIfNeeded()
//                print("12")
            default:
                break
            }
        })
    }
}
