//
//  ViewController.swift
//  Color Picker
//
//  Created by Erika Eckfeld on 10/10/19.
//  Copyright © 2019 Erika Eckfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorPicker: UIPickerView!
    
    let colors = [
        Color(name: "Red", color: .red),
        Color(name: "Orange", color: .orange),
        Color(name: "Yellow", color: .yellow),
        Color(name: "Green", color: .green),
        Color(name: "Blue", color: .blue),
        Color(name: "Purple", color: .purple)
    ]
    //added all of the possible colors to an array of colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorPicker.delegate = self
        colorPicker.dataSource = self
        let firstColor = colors.first
        colorLabel.text = firstColor?.name
        view.backgroundColor = firstColor?.color
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorLabel.text = colors[row].name
        view.backgroundColor = colors[row].color
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
}

struct Color {
    let name: String
    let color: UIColor
}
