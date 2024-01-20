//
//  ViewController.swift
//  Setting-Clone-App
//
//  Created by 재훈 on 1/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    var menuData: [[MenuData]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배경 색상 설정
        self.view.backgroundColor = #colorLiteral(red: 0.9484158158, green: 0.9493947625, blue: 0.9705184102, alpha: 1)
        // 델리게이트 패턴 적용
        self.settingTableView.delegate = self
        self.settingTableView.dataSource = self
        // 테이블 뷰의 배경색 적용
        self.settingTableView.backgroundColor = #colorLiteral(red: 0.9484158158, green: 0.9493947625, blue: 0.9705184102, alpha: 1)
        // 네비게이션 세팅
        self.navigationItem.title = "설정"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // xib파일 등록
        self.settingTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        self.settingTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        // 셋업 함수 실행
        setupData()
    }
    
    
    func setupData() {
        // 테이블 뷰의 첫번째 그룹
        self.menuData.append([
            MenuData(mainImage: UIImage(named: "rose"), mainDesc: "로제", subDesc: "Apple ID, iCloud, 미디어 및 구입 항목", arrowImage: UIImage(systemName: "chevron.right"))
        ])
        // 테이블 뷰의 두번째 그룹
        self.menuData.append([
            MenuData(mainImage: UIImage(systemName: "airplane"), mainDesc: "에어플레인 모드", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: UIImage(systemName: "wifi"), mainDesc: "Wi-Fi", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
        // 테이블 뷰의 세번째 그룹
        self.menuData.append([
            MenuData(mainImage: UIImage(systemName: "gearshape"), mainDesc: "일반", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
        // 테이블 뷰의 네번째 그룹
        self.menuData.append([
            MenuData(mainImage: UIImage(systemName: "speaker.wave.3"), mainDesc: "사운드 및 햅틱", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right")),
            MenuData(mainImage: UIImage(systemName: "moon.fill"), mainDesc: "집중 모드", subDesc: nil, arrowImage: UIImage(systemName: "chevron.right"))
        ])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? String else { return }
        let generalVC = segue.destination as! GeneralViewController
        generalVC.title = sender
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 2차원 배열의 수만 큼 그룹 생성
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuData.count
    }
    // 테이블 뷰에 나오는 셀의 수를 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData[section].count
    }
    // 테이블 뷰의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 70
        } else {
            return 40
        }
        
    }
    // 테이블 뷰의 각 셀을 불러오는 작업
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
            cell.selectionStyle = .none
            cell.userImage.image = menuData[indexPath.section][indexPath.row].mainImage
            cell.userName.text = menuData[indexPath.section][indexPath.row].mainDesc
            cell.profileDesc.text = menuData[indexPath.section][indexPath.row].subDesc
            cell.arrowImage.image = menuData[indexPath.section][indexPath.row].arrowImage
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.iconImage.image = menuData[indexPath.section][indexPath.row].mainImage
        cell.menuDesc.text = menuData[indexPath.section][indexPath.row].mainDesc
        cell.arrowImage.image = menuData[indexPath.section][indexPath.row].arrowImage
        return cell
    }
    
    // 테이블 뷰의 셀 클릭 시 화면 전환 작업
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0 && indexPath.row == 0){
            let myIDVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            self.present(myIDVC, animated: true)
        }
        
        if(indexPath.section == 2 && indexPath.row == 0){
            performSegue(withIdentifier: "toGeneralVC", sender: menuData[indexPath.section][indexPath.row].mainDesc)
        }

    }
}

