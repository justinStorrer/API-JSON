//
//  API&JSONTableViewController.swift
//  API & JSON
//
//  Created by Justin Storrer on 4/9/21.
//

import UIKit
import Kingfisher

class API_JSONTableViewController: UITableViewController {
    
    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCourses()
        
    }
    
    // How many rows?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func getCourses() {
        if let url = URL(string: "https://zappycode.com/api/courses") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: data!) {
                        DispatchQueue.main.async {
                            self.courses = coursesFromAPI
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                }
                
            }.resume()
        }
        
    }
    
    // what goes in each row?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as? CourseTableViewCell {
            
            let course = courses[indexPath.row]
            
            
            cell.titleViewLabel?.text = course.title
            cell.subtitleViewLabel?.text = course.subtitle
            
            if let url = URL(string: course.imageURL) {
                cell.courseImage.kf.setImage(with: url)
            }
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        getCourses()
    }
    
}
