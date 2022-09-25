//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Илья Дубенский on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var colorizedView: UIView!

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        colorizedView.layer.cornerRadius = 15

        colorizedViewSettings()
        slidersSettings()
        labelsSettings()

    }

    // MARK: - IBActions
    @IBAction func slidersActions(_ sender: UISlider!) {
        colorizedViewSettings()
        labelsSettings()

        switch sender.tag {
        case 0:
            redLabel.text = Int(sender.value).formatted()
        case 1:
            greenLabel.text = Int(sender.value).formatted()
        default:
            blueLabel.text = Int(sender.value).formatted()
        }
    }

    // MARK: - Privet Settings
    private func slidersSettings() {
        // Red
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        redSlider.setValue(75, animated: false)

        // Green
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        greenSlider.setValue(150, animated: false)

        // Blue
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
        blueSlider.setValue(225, animated: false)
    }

    private func labelsSettings() {
        redLabel.text = Int(redSlider.value).formatted()
        greenLabel.text = Int(greenSlider.value).formatted()
        blueLabel.text = Int(blueSlider.value).formatted()
    }

    private func colorizedViewSettings() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value) / 255,
            green: CGFloat(greenSlider.value) / 255,
            blue: CGFloat(blueSlider.value) / 255,
            alpha: 1
        )
    }
}

