//
//  ViewController.swift
//  SampleUITestsProject
//
//  Created by Clement Roulland on 16-11-02.
//  Copyright © 2016 clement. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeACall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Business

    func makeACall() {
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in
            
            guard let JSON = response.result.value as? [[String: Any]],
                let titleLabel = JSON.first?["title"] as? String else
            {
                self.titleLabel.text = "Failed 😢"
                return
            }
            
            self.bodyTextView.text = JSON.debugDescription
            self.titleLabel.text = titleLabel
        }
    }
}

