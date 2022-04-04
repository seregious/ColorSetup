//
//  ViewController.swift
//  ColorSetup
//
//  Created by Сергей Иванчихин on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 25
        changeColor()
        changeLabel()
        
    }

    @IBAction func redSliderMove() {
        changeColor()
        changeLabel()
    }
    
    @IBAction func greenSliderMove() {
        changeColor()
        changeLabel()
    }
    
    @IBAction func blueSliderMove() {
        changeColor()
        changeLabel()
    }
    
    
}

extension ViewController {
    private func changeColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        viewColor.backgroundColor = UIColor.init(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    
    private func changeLabel() {
        redLabel.text = "Red: " + String(format: "%.2f", redSlider.value)
        greenLabel.text = "Green: " + String(format: "%.2f", greenSlider.value)
        blueLabel.text = "Blue: " + String(format: "%.2f", blueSlider.value)
    }
}

