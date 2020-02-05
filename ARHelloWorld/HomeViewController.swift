//
//  HomeViewController.swift
//  ARHelloWorld
//
//  Created by Kim, Thang Lang on 1/31/20.
//  Copyright © 2020 Kim, Thang Lang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var xCord: UITextField!
    
    @IBOutlet weak var yCord: UITextField!
    
    @IBOutlet weak var zCord: UITextField!
    
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func go(_ sender: Any) {
        var check1 = Double(xCord.text!)
        var check2 = Double(yCord.text!)
        var check3 = Double(zCord.text!)
        
        if (check1 != nil && check2 != nil && check3 != nil){
            self.x = check1!;
            self.y = check2!;
            self.z = check3!;
            performSegue(withIdentifier: "switcher", sender: self)
        }
        else{
            print("User typed bad numbers")
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Button Pressed")
        var arview = segue.destination as! ViewController
        arview.x = self.x
        arview.y = self.y
        arview.z = self.z
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
