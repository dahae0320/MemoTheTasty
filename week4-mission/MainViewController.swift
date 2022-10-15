//
//  ViewController.swift
//  week4-mission
//
//  Created by Da Hae Lee on 2022/10/15.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memoTableView.delegate = self
        memoTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell", for: indexPath) as? MemoTableViewCell else {
            print("cell을 불러올 수 없습니다.")
            return UITableViewCell()
        }
        cell.titleLabel.text = memoData[indexPath.row].title
        cell.dateLabel.text = memoData[indexPath.row].date
        cell.descriptionLabel.text = memoData[indexPath.row].description
        
        if indexPath.row == 0 {
            cell.backgroundColor = .orange
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            memoData.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCell = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
            let alert = UIAlertController(title: "메모 삭제", message: "삭제하시면 복구가 불가능합니다.", preferredStyle: .alert)
            let delete = UIAlertAction(title: "삭제", style: .destructive, handler: { (action) in
                print("실제 삭제되는 코드")
                memoData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(delete)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
            completionHandler(true)
        })
        
        return UISwipeActionsConfiguration(actions: [deleteCell])
    }
    
    
}


