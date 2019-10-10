//
//  ViewController.swift
//  Color Picker
//
//  Created by Erika Eckfeld on 10/10/19.
//  Copyright © 2019 Erika Eckfeld. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    struct Color{
        let colorString : String
        let colorUI : UIColor
    }
    

    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    
    var colorsDataSource = [Color(colorString : "Red", colorUI : UIColor.red) , Color(colorString : "Orange", colorUI : UIColor.orange), Color(colorString : "Green", colorUI : UIColor.green) , Color(colorString : "Blue", colorUI : UIColor.blue) , Color(colorString : "Purple", colorUI : UIColor.purple)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self;
        self.picker.delegate = self;
        
        let initialIndex = 0
        pickerView(picker, didSelectRow: initialIndex, inComponent: initialIndex)
        
    }
    
    
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        label.text = colorsDataSource[row].colorString
        view.backgroundColor = colorsDataSource[row].colorUI
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorsDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorsDataSource[row].colorString
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
