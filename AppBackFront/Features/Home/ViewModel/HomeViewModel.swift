//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 29/09/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    private let service = HomeService()
    private var nftData: NFTData? // sempre vai conter todas as informações
    private var searchNFTData: NFTData? // vai conter apenas as informações filtradas
    weak private var delegate: HomeViewModelDelegate?
    
    func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNFTData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNFTData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
    //MARK: - FilterCollectionView
    
    public var numberOfItemsInSection: Int {
        return searchNFTData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNFT(indexPath: IndexPath) -> FilterNft {
        return searchNFTData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    //MARK: - NFTTableViewCell

    public var numberOfRowsInSection: Int {
        return searchNFTData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNFT(indexPath: IndexPath) -> Nft {
        return searchNFTData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    
    //MARK: - Filter
    
    var typeFilter: Int? {
        return searchNFTData?.filterListNft?.first(where: {$0.isSelected == true})?.id
    }
    
    public func filterSearchText(_ text: String) {
        
        var NFTList: [Nft] = []
        
        if typeFilter == 0 {
            NFTList = nftData?.nftList ?? []
        } else {
            NFTList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        if text.isEmpty {
            searchNFTData?.nftList = NFTList
        } else {
            searchNFTData?.nftList = NFTList.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
    
    public func setFilter(indexPath: IndexPath, searchText: String) {
        var filterNFT: [FilterNft] = []
        for (index, value) in (searchNFTData?.filterListNft ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNFTData?.filterListNft = filterNFT
        filterSearchText(searchText)
    }
    
}
