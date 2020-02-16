//
//  HomeViewController.swift
//  ARHelloWorld
//
//  Created by Kim, Thang Lang on 1/31/20.
//  Copyright © 2020 Kim, Thang Lang. All rights reserved.
//

<<<<<<< HEAD

//********************** READ ME ********************************
//The following code is commented. I tried to make this very easy to follow
//There is a lot of story boarding used so some of the functionality may not be seen in the code.
//Comments should help
//
//MAC and Tyson - Read func1 to see my vision on how the flow would work once we can implement satelliteKit
//
//For the final demo, I will take out the textboxes and have a list of buttons (which would represent different satellits)

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    //These variables allow me to get the contents of the textbox and pass them into the ARSCN
    @IBOutlet weak var xCord: UITextField!
    @IBOutlet weak var yCord: UITextField!
    @IBOutlet weak var zCord: UITextField!
    
    //"global" xyz variables that will be changed depending on the contents of the textboxs, or the satellite the user picks.
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    var locationManager: CLLocationManager = CLLocationManager() //Currently does nothing/not used
    var startLocation: CLLocation!                               //Currently does nothing/not used
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Next three lines are not used. location based stuff.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self //might want to change this if ARSCN wants to change this stuff/settings.
        startLocation = nil
        // Do any additional setup after loading the view.
    }
    

    
    
    //This function takes the contents of the text box and sends the xyz coordinates to the ARSCN View
    @IBAction func go(_ sender: Any) {
        var check1 = Double(xCord.text!)
        var check2 = Double(yCord.text!)
        var check3 = Double(zCord.text!)
        
<<<<<<< HEAD
        if (check1 != nil && check2 != nil && check3 != nil){ //This just checks if the values inside the textbox are valid
            self.x = check1!;
            self.y = check2!;
            self.z = check3!;
            performSegue(withIdentifier: "switcher", sender: self)
            //Switcher is the name of the segue/"transition" created in Main.storyboard. I just followed a tutorial for this part.
            //I think different types of segues can be utalized such as "present full".
        }
        else{
            print("User typed bad numbers")
            }
    }
    
    //** Important **
    // This is how the "First Screen" sends information to the ARSCN screen
    // A little confusing cause this is not explicitly called
    // This is called anytime "performSegue()" is called.
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Prepare was called")
        var arview = segue.destination as! ViewController //"ViewController is the name of the ARSCN.
        arview.x = self.x //Takes the current xyz values and sends it to the ARSCN/"ViewController"
        arview.y = self.y //View controller has the same named variable.
        arview.z = self.z
    }
    

    //Below is a list of satellites to chose from.
    @IBAction func sat1(_ sender: Any) {
        print("button 1 was presseed")
        //Call TLE fucntion from Satellite Kit - tle = TLE(*some hardcoded string based on the satellite name*)
        //                                                 Not sure what coordinates are needed here. MAC HELP!
        //sat = Satellite(withTLE: tle)
        //now = Date().julianDate
        //posInKms = sat.position(julianDays:now) -- gets position of the satellite
        //Here, call some funtion that will turn these positions to nice xyz coordinates
        // -eci2top_fixed function from Macs code base
        self.x = 1
        self.y = 1
        self.z = 1
        
        performSegue(withIdentifier: "switcher", sender: self)
        //Switcher is the name of the segue/"transition" created in Main.storyboard. I just followed a tutorial for this part.
        //I think different types of segues can be utalized such as "present full".
    }
    
 
    @IBAction func sat2(_ sender: Any) {
        print("button 2 was presseed")
        self.x = -1
        self.y = -1
        self.z = -1
        performSegue(withIdentifier: "switcher", sender: self)
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
