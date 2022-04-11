//
//  ViewController.swift
//  ColorSetup
//
//  Created by Сергей Иванчихин on 04.04.2022.
//

import UIKit

class SlidersViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var delegate: SliderViewControllerDelegate!
    var backgroundColor: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        changeLabelsAndColor()
        
        viewColor.layer.cornerRadius = 25
    }

    @IBAction func sliderMoves() {
        changeLabelsAndColor()
    }
    
    @IBAction func doneButton() {
        delegate?.setColor(color: getColor() )
        dismiss(animated: true)
    }
    
    
}

extension SlidersViewController {
    
    private func getColor () -> UIColor {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        return UIColor.init(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    
    private func changeColor() {
        viewColor.backgroundColor = getColor()
    }
    
    private func setTextFieldsValues() {
        
    }
    
    private func changeLabelsAndColor() {
        redLabel.text = "Red: " + String(format: "%.2f", redSlider.value)
        greenLabel.text = "Green: " + String(format: "%.2f", greenSlider.value)
        blueLabel.text = "Blue: " + String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        changeColor()
    }

}

extension SlidersViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let valueRange = Float(0)...Float(1)
        
        if let text = Float(textField.text ?? "0") {
            if valueRange.contains(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(text, animated: true)
            case greenTextField:
                greenSlider.setValue(text, animated: true)
            default:
                blueSlider.setValue(text, animated: true)
            }
            changeLabelsAndColor()
            return
            }
            showAlert(with: "Oh no", and: "You can use only numbers in range from 0 to 1", action: ())
        }
        showAlert(with: "Oh no", and: "You can use only numbers", action: ())
    }
    
    private func showAlert(with title: String, and massage: String, action: ()) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: "fine", style: .default) {_ in
            action
        }
        alert.addAction(dismissButton)
        present(alert, animated: true)
    }
}

