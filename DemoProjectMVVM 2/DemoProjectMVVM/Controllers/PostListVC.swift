//
//  PostListVC.swift
//  DemoProjectMVVM
//
//  Created by Mallikarjuna A on 30/08/24.
//

import UIKit

class PostListVC: UIViewController {
    @IBOutlet weak var postListTableview: UITableView!
    var postListVM:PostListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let urlPath = "https://jsonplaceholder.typicode.com/posts"
        let cellNib = UINib(nibName: "PostTableCell", bundle: nil)
        postListTableview.register(cellNib, forCellReuseIdentifier: "PostTableCell")
    postListVM = PostListViewModel()
        postListVM?.loadPosts(){ result in
            DispatchQueue.main.async { [weak self] in
                self?.postListTableview.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
}
extension PostListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postListVM?.postList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableCell", for: indexPath) as! PostTableCell
        let post = postListVM?.postAtIndex(at: indexPath.row)
        cell.postTitleLabel.text = post?.title
        return  cell
    }
    
    
}
