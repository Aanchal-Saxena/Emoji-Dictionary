//
//  EmojiTableViewController.swift
//  Emoji Dict
//
//  Created by Batch-2 on 01/05/24.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] =
    [
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness"),
      Emoji(symbol: "😁", name: "Grinning Face", description: "A typical smiley face", uasge: "Hapiness")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell)
        {
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        }
        else
        {
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    @IBAction func unwindToEmojiTableView(unwindSegue: UIStoryboardSegue)
    {
        guard unwindSegue.identifier == "saveUnwind",
              let sourceViewController = unwindSegue.source as? AddEditEmojiTableViewController,
              let emoji = sourceViewController.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    
    
    
    
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        let emoji = emojis[indexPath.row]
//        print("\(emoji.symbol) \(indexPath)")
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        // Configure the cell...
        let emoji = emojis[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.text = "\(emoji.symbol) - \(emoji.name)"
//        content.secondaryText = emoji.description
//        cell.contentConfiguration = content
//        cell.showsReorderControl = true
        
        cell.update(with: emoji)
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
    {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    {
        return .delete
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
    }
    

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
