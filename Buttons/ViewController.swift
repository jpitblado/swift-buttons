//
//  ViewController.swift
//  Buttons
//
//  Created by Jeffrey Pitblado on 7/23/17.
//  Copyright © 2017 Jeffrey Pitblado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let Rows = 2
	let Cols = 2

	var states = [Int()]
	var colors = [UIColor()]
	var compColors = [UIColor()]

	override func viewDidLoad() {
		super.viewDidLoad()

		let buttonWidth = view.frame.width / CGFloat(Cols + 2)
		let buttonHeight = view.frame.height / CGFloat(Rows + 2)
		print("buttonWidth = \(buttonWidth)")
		print("buttonHeight = \(buttonHeight)")

		colors.removeAll()
		colors.append(UIColor.red)
		colors.append(UIColor.orange)
		colors.append(UIColor.yellow)
		colors.append(UIColor.green)
		colors.append(UIColor.blue)
		colors.append(UIColor.purple)

		compColors.removeAll()
		compColors.append(UIColor.green)
		compColors.append(UIColor.blue)
		compColors.append(UIColor.purple)
		compColors.append(UIColor.red)
		compColors.append(UIColor.orange)
		compColors.append(UIColor.yellow)

		states.removeAll()
		var buttonIndex = 0
		for r in 0 ..< Rows {
			for c in 0 ..< Cols {
				states.append(0)

				let rect = CGRect(x: CGFloat(c+1)*buttonWidth,
				                  y: CGFloat(r+1)*buttonHeight,
				                  width: buttonWidth,
				                  height: buttonHeight)
				print("rect for button \(buttonIndex) : \(rect)")

				let button = UIButton(frame: rect)
				button.tag = buttonIndex
				button.setTitle("Button \(buttonIndex)", for: .normal)
				button.setTitleColor(.blue, for: .normal)
				button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

				self.view.addSubview(button)

				buttonIndex += 1
			}
		}
	}

	func buttonPressed(sender: UIButton!) {
		var state = 0
		let tag = sender.tag
		if (0 <= tag) && (tag < states.count) {
			states[tag] += 1
			state = states[tag]
		}
		else {
			print("tag \(tag) too big for states array (has \(states.count) elements")
		}

		switch tag {
		case 0:
			sender.setTitle("\(state)", for: .normal)

		case 1:
			sender.setTitle("\(state)", for: .normal)
			if state % 2 == 0 {
				sender.setTitleColor(.blue, for: .normal)
				sender.backgroundColor = nil
			}
			else {
				sender.setTitleColor(.white, for: .normal)
				sender.backgroundColor = .blue
			}

		case 2:
			sender.setTitle("\(state)", for: .normal)
			if state % 2 == 0 {
				sender.setTitleColor(colors[state % colors.count], for: .normal)
				sender.backgroundColor = nil
			}
			else {
				sender.setTitleColor(.white, for: .normal)
				sender.backgroundColor = colors[state % colors.count]
			}

		case 3:
			sender.setTitle("\(state)", for: .normal)
			sender.backgroundColor = compColors[state % compColors.count]
			sender.setTitleColor(colors[state % colors.count], for: .normal)

		default:
			print("tag \(tag) has no action yet")
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}

