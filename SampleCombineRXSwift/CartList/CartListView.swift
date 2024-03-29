//
//  CartListView.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation
import UIKit


class CartListView: UIView {
    
    //MARK: - Outlets
    var cartTableView: UITableView?
    var cartTotalContainerView: UIView?
    var cartTitleView: UIView?

    let cartTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.text = "CART"
        return lbl
    }()

    let subTotalTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.text = "SubTotal"
        return lbl
    }()
    
    let subTotalPrice : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()
    
    let taxesTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.text = "Tax"
        return lbl
    }()
    
    let taxesPrice : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()

    let totalTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.text = "Total"
        return lbl
    }()
    
    let totalPrice : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()

    let checkoutButton : UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5 //TMP
        btn.layer.masksToBounds = true
        btn.backgroundColor = .lightGray //TMP
        btn.titleLabel?.textColor = .black //TMP
        btn.setTitle("CHECKOUT", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12) //TMP
        return btn
    }()

    //MARK: - Constraints Methods
    private func setCartTotalView(){
        cartTotalContainerView?.addSubview(subTotalTitleLabel)
        cartTotalContainerView?.addSubview(subTotalPrice)
        cartTotalContainerView?.addSubview(taxesTitleLabel)
        cartTotalContainerView?.addSubview(taxesPrice)
        cartTotalContainerView?.addSubview(totalTitleLabel)
        cartTotalContainerView?.addSubview(totalPrice)
        cartTotalContainerView?.addSubview(checkoutButton)

        subTotalTitleLabel.anchor(top: cartTableView?.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: self.frame.width/2, height: 0, enableInsets: false)
        subTotalPrice.anchor(top: subTotalTitleLabel.topAnchor, left: subTotalTitleLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 5, paddingRight: 10, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        taxesTitleLabel.anchor(top: subTotalTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 5, paddingRight: 10, width: self.frame.width/2, height: 0, enableInsets: false)
        taxesPrice.anchor(top: taxesTitleLabel.topAnchor, left: taxesTitleLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 10, width: self.frame.width/2, height: 0, enableInsets: false)
        
        totalTitleLabel.anchor(top: taxesTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: self.frame.width/2, height: 0, enableInsets: false)
        totalPrice.anchor(top: totalTitleLabel.topAnchor, left: totalTitleLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: self.frame.width/2, height: 0, enableInsets: false)

        checkoutButton.anchor(top: totalPrice.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 50, paddingLeft: 5, paddingBottom: 50, paddingRight: 10, width: self.frame.width, height: 30, enableInsets: false)
    }
    
    private func setup() {
        let _ = subviews.map({$0.removeFromSuperview()}) // just in case
        
        let cartTitleView = UIView()
        let cartTableView = UITableView()
        let cartTotalContainerView = UIView()
        let cartTitleSeperatorView = UIView()

        self.cartTitleView = cartTitleView
        self.cartTableView = cartTableView
        self.cartTotalContainerView = cartTotalContainerView
        
        self.cartTotalContainerView?.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.cartTitleView?.backgroundColor = .white
        cartTitleSeperatorView.backgroundColor = .lightGray

        addSubview(cartTableView)
        addSubview(cartTotalContainerView)
        addSubview(cartTitleView)
        
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTitleView.translatesAutoresizingMaskIntoConstraints = false
        cartTotalContainerView.translatesAutoresizingMaskIntoConstraints = false
        cartTitleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cartTitleView.topAnchor.constraint(equalTo: topAnchor),
            cartTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartTitleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartTitleView.bottomAnchor.constraint(equalTo: cartTableView.topAnchor),
            cartTitleView.heightAnchor.constraint(equalToConstant: 50),
            cartTableView.topAnchor.constraint(equalTo: cartTitleView.bottomAnchor),
            cartTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartTableView.bottomAnchor.constraint(equalTo: cartTotalContainerView.topAnchor),
            
            cartTotalContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartTotalContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartTotalContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cartTotalContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
        self.cartTableView?.rowHeight = UITableView.automaticDimension
        self.cartTableView?.estimatedRowHeight = UITableView.automaticDimension
        
        self.cartTitleView?.addSubview(cartTitleLabel)
        cartTitleLabel.anchor(top: cartTitleView.topAnchor, left: leftAnchor, bottom: cartTitleView.bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width - 10, height: 0, enableInsets: false)
        
        cartTitleView.addSubview(cartTitleSeperatorView)
        cartTitleSeperatorView.anchor(top: nil, left: leftAnchor, bottom: cartTitleView.bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width - 10, height: 1, enableInsets: false)


    }
    
    //MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setCartTotalView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


