//
//  DetaislViewController.swift
//  Project1
//
//  Created by Marko Poikkimäki on 2018-05-13.
//  Copyright © 2018 Marko Poikkimäki. All rights reserved.
//

import Cocoa

class DetaislViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: NSImage.Name(rawValue: name))
    }
    
}
