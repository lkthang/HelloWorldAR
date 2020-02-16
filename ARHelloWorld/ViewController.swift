//
//  ViewController.swift
//  ARHelloWorld
//
//  Created by Kim, Thang Lang on 1/30/20.
//  Copyright © 2020 Kim, Thang Lang. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        //making a red ball to represent satellite - change this to a picture of a satellite later
        let redball = SCNSphere(radius: 0.05)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        redball.materials = [material]
        
        let testOBJ = SCNNode(geometry: redball) 
        let startPosition = SCNVector3Make(Float(x), Float(y), Float(z))
        testOBJ.position = startPosition
        // Set the scene to the view
        //sceneView.scene = scene
        //NSLog("plane loaded")
        sceneView.scene.rootNode.addChildNode(testOBJ)
        NSLog("ball added")
        NSLog("X: \(x) Y: \(y): Z:\(z)")
        
        //**Should show the calculated numbers that the hobbiest would calculate on their own
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

