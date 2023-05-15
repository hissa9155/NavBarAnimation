//
//  NavAnimationViewController.swift
//  NavBarAnimation
//
//  Created by H.Namikawa on 2023/05/11.
//

import UIKit

class NavAnimationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  private let cellId = "SnacksCell"
  var isUiViewExpanded = false
  
  lazy var uiView: UIView = {
    let uiView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
    //uiView.translatesAutoresizingMaskIntoConstraints = false
    uiView.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    return uiView
  }()
  
  let titleLbl: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.text = "SNACKS"
    lbl.font = UIFont.systemFont(ofSize: 30)
    lbl.textAlignment = .center
    return lbl
  }()
  
  let addBtn: UIButton = {
    let btn = UIButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("➕", for: .normal)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    return btn
  }()
  
  let imgsSV: UIStackView = {
    let sv = UIStackView()
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .horizontal
    sv.spacing = 5
    sv.alignment = .center
    sv.distribution = .equalCentering
    return sv
  }()
  let oreoImgBtn: UIButton = {
    let img = UIImage(named: "oreos")
    let imgBtn = UIButton()
    imgBtn.translatesAutoresizingMaskIntoConstraints = false
    imgBtn.setImage(img, for: .normal)
    imgBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    imgBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return imgBtn
  }()
  let pizzaPocketsImgBtn: UIButton = {
    let img = UIImage(named: "pizza_pockets")
    let imgBtn = UIButton()
    imgBtn.translatesAutoresizingMaskIntoConstraints = false
    imgBtn.setImage(img, for: .normal)
    imgBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    imgBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return imgBtn
  }()
  let popTartsImgBtn: UIButton = {
    let img = UIImage(named: "pop_tarts")
    let imgBtn = UIButton()
    imgBtn.translatesAutoresizingMaskIntoConstraints = false
    imgBtn.setImage(img, for: .normal)
    imgBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    imgBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return imgBtn
  }()
  let popsicleImgBtn: UIButton = {
    let img = UIImage(named: "popsicle")
    let imgBtn = UIButton()
    imgBtn.translatesAutoresizingMaskIntoConstraints = false
    imgBtn.setImage(img, for: .normal)
    imgBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    imgBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return imgBtn
  }()
  let ramenImgBtn: UIButton = {
    let img = UIImage(named: "ramen")
    let imgBtn = UIButton()
    imgBtn.translatesAutoresizingMaskIntoConstraints = false
    imgBtn.setImage(img, for: .normal)
    imgBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    imgBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return imgBtn
  }()
  
  lazy var snacksTbl: UITableView = {
    let tblV = UITableView(frame: CGRect.zero, style: .grouped)
    tblV.translatesAutoresizingMaskIntoConstraints = false
    tblV.register(SnacksTableViewCell.self, forCellReuseIdentifier: cellId)
    //tblV.rowHeight = 50
    return tblV
  }()
  
  var selectedSnacks: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(uiView)
//    uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//    uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//    uiView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//    uiViewHeightAnchorConstraint = uiView.heightAnchor.constraint(equalToConstant: 100)
//    uiViewHeightAnchorConstraint?.isActive = true
    
    uiView.addSubview(titleLbl)
    titleLbl.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 60).isActive = true
    titleLbl.centerXAnchor.constraint(equalTo: uiView.centerXAnchor).isActive = true
    titleLbl.widthAnchor.constraint(equalTo: uiView.widthAnchor, multiplier: 0.5).isActive = true
    titleLbl.heightAnchor.constraint(equalToConstant: 35).isActive = true

    uiView.addSubview(addBtn)
    addBtn.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 60).isActive = true
    addBtn.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -10).isActive = true
    addBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    addBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
    addBtn.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)

    uiView.addSubview(imgsSV)
    imgsSV.addArrangedSubview(oreoImgBtn)
    imgsSV.addArrangedSubview(pizzaPocketsImgBtn)
    imgsSV.addArrangedSubview(popTartsImgBtn)
    imgsSV.addArrangedSubview(popsicleImgBtn)
    imgsSV.addArrangedSubview(ramenImgBtn)
    oreoImgBtn.addTarget(self, action: #selector(imgBtnTapped(_:)), for: .touchUpInside)
    pizzaPocketsImgBtn.addTarget(self, action: #selector(imgBtnTapped(_:)), for: .touchUpInside)
    popTartsImgBtn.addTarget(self, action: #selector(imgBtnTapped(_:)), for: .touchUpInside)
    popsicleImgBtn.addTarget(self, action: #selector(imgBtnTapped(_:)), for: .touchUpInside)
    ramenImgBtn.addTarget(self, action: #selector(imgBtnTapped(_:)), for: .touchUpInside)

    imgsSV.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 110).isActive = true
    imgsSV.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 0).isActive = true
    imgsSV.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 0).isActive = true
    imgsSV.heightAnchor.constraint(equalToConstant: 120).isActive = true
    imgsSV.isHidden = true
    
    view.addSubview(snacksTbl)
    snacksTbl.delegate = self
    snacksTbl.dataSource = self
    snacksTbl.topAnchor.constraint(equalTo: uiView.bottomAnchor).isActive = true
    snacksTbl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    snacksTbl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    snacksTbl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  // table view implementation
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedSnacks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SnacksTableViewCell
    let snack = selectedSnacks[indexPath.row]
    var content = cell.defaultContentConfiguration()
    content.text = snack
    cell.contentConfiguration = content
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  @objc private func addButtonTapped(_ sender:UIBarButtonItem){
    UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5) {
      if (self.isUiViewExpanded) {
        self.uiView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        self.titleLbl.text = "SNACKS"
        self.addBtn.transform = .identity
        self.imgsSV.isHidden = true
      } else {
        self.uiView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 230)
        self.titleLbl.text = "Add a SNACK"
        let addBtnRotate = CGAffineTransform(rotationAngle: .pi + .pi / 4)
        self.addBtn.transform = addBtnRotate
        self.imgsSV.isHidden = false
      }
    } completion: { (_) in
      self.isUiViewExpanded.toggle()
    }
  }
  
  @objc private func imgBtnTapped(_ sender:UIButton){
    var snackName: String
    if sender == oreoImgBtn {
      snackName = "Oreo"
    } else if sender == popTartsImgBtn {
      snackName = "Pop Tarts"
    } else if sender == popsicleImgBtn {
      snackName = "Popsicle"
    } else if sender == pizzaPocketsImgBtn {
      snackName = "Pizza Pockets"
    } else if sender == ramenImgBtn {
      snackName = "Ramen"
    } else {
      return
    }
    selectedSnacks.append(snackName)
    snacksTbl.insertRows(at: [IndexPath(row: selectedSnacks.count - 1, section: 0)], with: .automatic)
  }
}
