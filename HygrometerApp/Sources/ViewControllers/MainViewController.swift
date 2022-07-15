//
//  MainViewController.swift
//  HygrometerApp
//
//  Created by 홍승현 on 2022/07/09.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    /// 지역별 습도를 보여주는 VC를 갖고있는 pageViewController 입니다.
    /// 양옆으로 스와이프하여 `viewController`이동이 가능하도록 설계되었습니다.
    private lazy var pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    ).then {
        $0.setViewControllers([CityViewController()], direction: .forward, animated: true)
    }
    
    private lazy var listButton = UIButton().then {
        $0.setImage(UIImage(systemName: "list.star"), for: .normal)
        $0.tintColor = .label
    }
    
    private lazy var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .label
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupConstraints()
        setupStyles()
    }
    
    // MARK: - Configuration
    
    /// view에 올려놓을 프로퍼티를 설정합니다. `addSubview` 메서드를 여기에 작성합니다.
    private func setupLayouts() {
        view.addSubview(pageViewController.view)
        view.addSubview(listButton)
        view.addSubview(plusButton)
    }
    
    
    /// 프로퍼티의 제약조건을 설정합니다.
    private func setupConstraints() {
        
        pageViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        listButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.width.height.equalTo(50)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(listButton.snp.bottom).inset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.width.height.equalTo(50)
        }
    }
    
    
    /// ViewController 내에 style을 설정합니다.
    private func setupStyles() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
}