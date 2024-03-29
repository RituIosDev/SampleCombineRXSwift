//
//  ProductListViewControllerTests.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import XCTest
@testable import SampleCombineRXSwift

class ProductListViewControllerTests: XCTestCase {

    var viewControllerUnderTest: ProductListViewController!
    var presenter: MockProductListPresenter!
    
    override func setUpWithError() throws {
        
        presenter = MockProductListPresenter()
        presenter.initiateProductList()
        self.viewControllerUnderTest = ProductListViewController(with: presenter)
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    
        presenter.listOfProducts = [Product.defaultProduct]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
      //  XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.cartListView.cartTableView?(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.productListView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ProductTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = ProductTableViewCell.reuseIdentifier
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
}

