//
//  ColorViewController.swift
//  ColorSetup
//
//  Created by Сергей Иванчихин on 11.04.2022.
//

import UIKit

protocol SliderViewControllerDelegate {
    func setColor(color: UIColor)
}

class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let slidersVC = segue.destination as! SlidersViewController
        slidersVC.delegate = self
    }
}

extension ColorViewController: SliderViewControllerDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }

}
