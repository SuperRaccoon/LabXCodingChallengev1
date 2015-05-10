//
//  ViewController.swift
//  ZekunAppV2
//
//  Created by Zekun Wang on 5/9/15.
//  Copyright (c) 2015 Zekun Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet var Satellite : UIImageView!
    
    @IBOutlet weak var Speed: UISlider!
    @IBAction func speedSlider(sender: AnyObject) {
        
        mySpeed = Speed.value * 2
        
    }
    
    @IBOutlet weak var myRadiusSlider: UISlider!
    
    @IBAction func radiusSlider(sender: AnyObject) {
        
        radius = myRadiusSlider.value * 200 + 0.1
    }
    
    var radius: Float = 100.0
    var mySpeed: Float = 1.0
    
    
    let myCenterX: CGFloat = (UIScreen.mainScreen().bounds.size.width) * 0.5
    let myCenterY: CGFloat = (UIScreen.mainScreen().bounds.size.height) * 0.5

    var myCurrDegree: Float = 0.0
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var speed = Float(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Satellite.center.x = self.view.frame.width/2
        Satellite.center.y = self.view.frame.height/2
        
        
        Satellite.center = CGPointMake(10, 100)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        Satellite.center = CGPointMake(100, 0)
        
        var initSetup = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("InitializePos"), userInfo: nil, repeats: false)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("setPos"), userInfo: nil, repeats: true)
    }
    
    func InitializePos(){
        let myCGX1 = myCenterX
        let myCGY1 = CGFloat(Float(myCenterY) + radius)
        Satellite.center = CGPointMake(myCGX1, myCGY1)
    }
    

    func setPos(){
        /*
        let X = arc4random_uniform(100)
        let Y = arc4random_uniform(100)
        let myX = CGFloat(X)
        let myY = CGFloat(Y)
        Satellite.center = CGPointMake(myX, myY)
    */
        /*
        let myCurrX = Satellite.center.x - myCenterX
        let myCurrY = Satellite.center.y - myCenterY
        let D: Float = Float(currDegree(myCurrX, MyY: myCurrY))
        
        let myNextXF = calculateX(radius, speed: mySpeed, currD: D)
        let myNextYF = calculateY(radius, speed: mySpeed, currD: D)
        
        let myXI = CGFloat(myNextXF) + myCenterX
        let myYI = CGFloat(myNextYF) + myCenterY
        
        //Satellite.center.x = CGFloat(myXI)
        //Satellite.center.y = CGFlo
        at(myXI)
        
        Satellite.center.x = myCurrX + CGFloat(10)
        Satellite.center.y = myCurrY + CGFloat(10)
        */
        
        
        updateAngle()
        updateX()
        updateY()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func calculateAV() -> Float {
        return 360.0*(mySpeed/(2.0*3.14*radius))
    }
    
    func updateAngle() {
        
        let aV = calculateAV()
        
        
        
        myCurrDegree = aV + myCurrDegree
        
        
        if (myCurrDegree > 360){
            myCurrDegree = myCurrDegree - (2*(3.141592658))
        }
        
       
    }
    
    func updateX(){
        Satellite.center.x = CGFloat(radius*cos(myCurrDegree)) + myCenterX
        
    }
    
    func updateY(){
        Satellite.center.y = CGFloat(radius*sin(myCurrDegree)) + myCenterY
    }

}

