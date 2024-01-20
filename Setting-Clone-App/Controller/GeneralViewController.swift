//
//  GeneralViewController.swift
//  Setting-Clone-App
//
//  Created by 재훈 on 1/19/24.
//

import UIKit

class GeneralViewController: UIViewController {
    
    @IBOutlet weak var generalTableView: UITableView!
    var generalData: [[MenuData]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9484158158, green: 0.9493947625, blue: 0.9705184102, alpha: 1)
        self.generalTableView.backgroundColor = #colorLiteral(red: 0.9484158158, green: 0.9493947625, blue: 0.9705184102, alpha: 1)
        self.generalTableView.delegate = self
        self.generalTableView.dataSource = self
        self.generalTableView.register(UINib(nibName: "GeneralTableViewCell", bundle: nil), forCellReuseIdentifier: "GeneralCell")
        self.setupData()
    }

    func setupData() {
        generalData.append([
            MenuData(mainImage: nil, mainDesc: "정보", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
        generalData.append([
            MenuData(mainImage: nil, mainDesc: "키보드", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: nil, mainDesc: "게임 컨트롤러", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: nil, mainDesc: "서체", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: nil, mainDesc: "언어 및 지역", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: nil, mainDesc: "사전", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
        generalData.append([
            MenuData(mainImage: nil, mainDesc: "VPN 및 기기 관리", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
        generalData.append([
            MenuData(mainImage: nil, mainDesc: "전송 또는 iPhone 재설정", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
    }
    
}

extension GeneralViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        generalData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        generalData[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell") as! GeneralTableViewCell
        cell.mainDesc.text = generalData[indexPath.section][indexPath.row].mainDesc
        cell.arrowImage.image = generalData[indexPath.section][indexPath.row].arrowImage
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    
    
    
}
