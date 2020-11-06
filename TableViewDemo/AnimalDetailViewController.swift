//
//  AnimalDetailViewController.swift
//  TableViewDemo
//
//  Created by Taylor Smith on 11/5/20.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    var animal: Animal?

    @IBOutlet weak var pictureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var animalDetailsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // configure our detail view
        if let animal = animal {
            pictureLabel.text = animal.picture
            nameLabel.text = animal.name
            areaLabel.text = animal.area
            if let details = animal.detailDescription {
                animalDetailsTextView.text = details
            }
        }
    }

    // actions...

    // other methods...
}
