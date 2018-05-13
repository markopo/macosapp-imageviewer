//
//  SourceViewController.swift
//  Project1
//
//  Created by Marko Poikkimäki on 2018-05-13.
//  Copyright © 2018 Marko Poikkimäki. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
      //  print(items.count)
        
        for item in items {
        //    print(item)
            if item.contains(".JPG") {
                pictures.append(item)
            }
        }
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        let picture = pictures[row]
        vw.textField?.stringValue = picture

        return vw
    }
    
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.childViewControllers[1] as? DetaislViewController {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }        
    }
    
    
}
