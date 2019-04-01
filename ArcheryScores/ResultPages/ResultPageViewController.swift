//
//  ResultPageViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 31.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class ResultPageViewController: UIPageViewController {
    
    var result: Result?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newPageViewController(identifier: "sb1"),
                self.newPageViewController(identifier: "sb2"),
                self.newPageViewController(identifier: "sb3"),
                self.newPageViewController(identifier: "sb4"),
                self.newPageViewController(identifier: "sb5"),
                self.newPageViewController(identifier: "sb6")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        stylePageControl()
    }
    
    private func newPageViewController(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    private func stylePageControl() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [type(of: self)])
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.backgroundColor = UIColor.white
    }
    
    /*private func stylePageControl() {
        let pageControl = UIPageControl.appearanceWhenContainedInInstancesOfClasses([self.dynamicType])
        
        pageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        pageControl.pageIndicatorTintColor = UIColor.greenColor()
        pageControl.backgroundColor = UIColor.orangeColor()
    }*/
    
}
    
    //MARK: UIPageViewControllerDataSource
    
extension ResultPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex  = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
                return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
    
}


