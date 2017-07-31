//
//  ViewController.swift
//  PocketMole
//
//  Created by DianQK on 2017/7/31.
//  Copyright © 2017年 dianqk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = (1...rules.count).map { Variable($0) }
        
        typealias SectionModel = RxDataSources.SectionModel<(), Observable<String>>
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel>()
        dataSource.configureCell = { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            item.bind(to: cell.label.rx.text).disposed(by: cell.reuseDisposeBag)
            return cell
        }
        
        Observable.just(items)
            .map { $0.map { $0.asObservable().map { "\($0)" } } }
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected.asObservable().map { $0.row }
            .map { index in rules.first(where: { $0.index1 == index })! }
            .subscribe(onNext: { (rule) in
                let value1 = items[rule.index1]
                let value2 = items[rule.index2]
                let value3 = items[rule.index3]
                value1.value = rule.result(value1.value, value2.value, value3.value)
            })
            .disposed(by: disposeBag)
 
        collectionView.rx.itemSelected.asObservable()
            .subscribe(onNext: { [weak self] (indexPath) in
                self?.collectionView.deselectItem(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
    }

}
