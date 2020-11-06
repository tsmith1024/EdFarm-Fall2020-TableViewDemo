//
//  DemoTableViewController.swift
//  TableViewDemo
//
//  Created by Taylor Smith on 11/5/20.
//

import UIKit

struct Animal: Comparable {
    var picture: String
    var name: String
    var area: String
    var detailDescription: String?


    static func < (lhs: Animal, rhs: Animal) -> Bool {
        if lhs.area == rhs.area {
            return lhs.name < rhs.name
        }
        return lhs.area < rhs.area
    }
}

class DemoTableViewController: UITableViewController {
    let animals: [Animal] = [
        Animal(picture: "🐘", name: "Elephant", area: "Africa", detailDescription: "Elephants are mammals of the family Elephantidae and the largest existing land animals. Three species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. Elephantidae is the only surviving family of the order Proboscidea; extinct members include the mastodons. The family Elephantidae also contains several now-extinct groups, including the mammoths and straight-tusked elephants. African elephants have larger ears and concave backs, whereas Asian elephants have smaller ears, and convex or level backs. Distinctive features of all elephants include a long proboscis called a trunk, tusks, large ear flaps, massive legs, and tough but sensitive skin."),
        Animal(picture: "🦞", name: "Lobster", area: "Open Ocean"),
        Animal(picture: "🐬", name: "Dolphin", area: "Open Ocean"),
        Animal(picture: "🦒", name: "Giraffe", area: "Africa"),
        Animal(picture: "🦦", name: "Otter", area: "Rivers & Streams"),
        Animal(picture: "🦕", name: "DINOSAUR", area: "Jurassic")
    ].sorted()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AnimalDetailSegue":
            if let destinationViewController = segue.destination as? AnimalDetailViewController, let sender = sender as? Animal {
                destinationViewController.animal = sender
            }
        default:
            print("this shouldn't be happening")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomAnimalCell", for: indexPath) as! CustomAnimalCell

        let cellAnimal = animals[indexPath.row]
        cell.pictureLabel.text = cellAnimal.picture
        cell.nameLabel.text = cellAnimal.name
        cell.areaLabel.text = cellAnimal.area

//        cell.textLabel?.text = "\(cellAnimal.picture) - \(cellAnimal.name)"
//
//        cell.detailTextLabel?.text = cellAnimal.area

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellAnimal = animals[indexPath.row]
        performSegue(withIdentifier: "AnimalDetailSegue", sender: cellAnimal)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
