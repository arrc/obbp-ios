//
//  RequestViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import XLForm

class RequestViewController: XLFormViewController {
    
    // Outlets
    
    // Properties
    var payload: NSDictionary? = nil

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initializeForm()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeForm()
    }
    
    // Initial view load
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonLeft = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: nil)
        let barButtonRight = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: "savePressed:")
        navigationItem.rightBarButtonItem = barButtonRight
        navigationItem.rightBarButtonItem = barButtonLeft
    }
    
    func savePressed(button : UIBarButtonItem)
    {
        print(formValues())
    }

    
    func initializeForm() {
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Selectors")
        section = XLFormSectionDescriptor.formSectionWithTitle("Selectors")
        section.footerTitle = "SelectorsFormViewController.swift"
        form.addFormSection(section)
        
        // --------- Inline Selectors
        section = XLFormSectionDescriptor.formSectionWithTitle("Select the required blood group.")
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: "multipleSelector", rowType:XLFormRowDescriptorTypeSelectorPickerViewInline, title:"Blood Group")
        row.selectorOptions = ["A+", "A-", "B+", "B-", "O+", "O-"]
        // row.value = "Option 6"
        section.addFormRow(row)
        
        // Selector Picker View
        row = XLFormRowDescriptor(tag: "selectorPickerView", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Picker View")
        row.selectorOptions = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
        row.value = "Option 4"
        section.addFormRow(row)


        self.form = form
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
