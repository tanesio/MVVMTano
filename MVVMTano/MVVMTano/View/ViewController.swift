//
//  ViewController.swift
//  MVVMTano
//
//  Created by admin on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = viewModelList()
//    var viewCell = CustomCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
        
    }

    private func configureView () {
        activity.isHidden = false
        activity.startAnimating()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomCell")
        viewModel.retriveDataList()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        
        // dequeueReusableCell(withIdentifier: "Cell") as CustomCell
        let object = viewModel.dataArray[indexPath.row]
        
//        cell.textLabel?.text = object.title
//        cell.detailTextLabel?.text = object.body
        
      cell.setup(object: object)
        
        return cell
    }
    
    
}
