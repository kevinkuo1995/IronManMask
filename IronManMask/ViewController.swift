//
//  ViewController.swift
//  IronManMask
//
//  Created by KUO Chin Wei on 2019/3/19.
//  Copyright © 2019 KevinKuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var originalView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var blendsSlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var cornerRadiusLabel: UILabel!
    @IBOutlet weak var redSliderSwitch: UISwitch!
    @IBOutlet weak var greenSliderSwitch: UISwitch!
    @IBOutlet weak var blueSliderSwitch: UISwitch!
    @IBOutlet weak var blendsSWitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        redLabel.text  = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text  = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        if let gradientLayer = imageView.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.colors = [UIColor.black.cgColor, UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor, UIColor.black.cgColor]
        }
        
        
    }
    
    
    @IBAction func corenerRadiusChanged(_ sender: UISlider) {
        cornerRadiusSlider.value.round()
        imageView.layer.cornerRadius = CGFloat(sender.value)
        colorView.layer.cornerRadius = CGFloat(sender.value)
        originalView.layer.cornerRadius = CGFloat(sender.value)
        cornerRadiusLabel.text = String(cornerRadiusSlider.value)
        if let gradientLayer = imageView.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.cornerRadius = CGFloat(sender.value)
        }
    }
    
    @IBAction func switchb(_ sender: Any) {
        redSlider.isEnabled = redSliderSwitch.isOn
        greenSlider.isEnabled = greenSliderSwitch.isOn
        blueSlider.isEnabled = blueSliderSwitch.isOn
        
    }

    
    @IBAction func random(_ sender: Any) {
        let rvalue = Float.random(in: 0...1)
        let gvalue = Float.random(in: 0...1)
        let bvalue = Float.random(in: 0...1)
        redSlider.value = rvalue
        greenSlider.value = gvalue
        blueSlider.value = bvalue
        imageView.backgroundColor = UIColor(red: CGFloat(rvalue), green: CGFloat(gvalue), blue: CGFloat(bvalue), alpha: CGFloat(alphaSlider.value))
        if let gradientLayer = imageView.layer.sublayers?[0] as? CAGradientLayer{
            gradientLayer.colors = [UIColor.black.cgColor , UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor,UIColor.black.cgColor]
        }
        
        
    }
    
    @IBAction func blendChanged(_ sender: UISwitch) {
        if blendsSWitch.isOn == true,imageView.layer.sublayers == nil {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = imageView.bounds
            gradientLayer.colors = [UIColor.black.cgColor , UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor,UIColor.black.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.cornerRadius = CGFloat(cornerRadiusSlider.value)
            gradientLayer.locations = [0, 0.5, 1]
            imageView.layer.addSublayer(gradientLayer)
            blendsSlider.isEnabled = blendsSWitch.isOn
        }else{
            blendsSlider.isEnabled = blendsSWitch.isOn
            imageView.layer.sublayers = nil
        }
        
        
    }
    
    
    
    
    
    @IBAction func blendSlider(_ sender: UISlider) {
            if let gradientLayer = imageView.layer.sublayers?[0] as? CAGradientLayer {
                gradientLayer.locations = [0, NSNumber(value: sender.value),1]
            }
        
        
    }
    
}

