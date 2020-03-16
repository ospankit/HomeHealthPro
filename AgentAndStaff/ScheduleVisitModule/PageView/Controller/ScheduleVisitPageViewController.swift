//
//  ScheduleVisitPageViewController.swift
//  HomeHealthPro
//
//  Created by Ankit on 12/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ScheduleVisitPageViewController: UIPageViewController {

    lazy var showViewController : [UIViewController] = {
        return [self.newViewController(viewControllerName: Controller.ScheduleVisitPatientDetailVC.identifier),
                self.newViewController(viewControllerName: Controller.ScheduleVisitDetailVC.identifier)]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let firstViewController = showViewController.first {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.source)
    }
}

extension ScheduleVisitPageViewController {
    func newViewController(viewControllerName : String) -> UIViewController {
        return UIStoryboard(name: StoryBoard.ScheduleVisit.indentifier, bundle: nil).instantiateViewController(identifier: viewControllerName)
    }
    
    func backAndForwardActionPageViewController(viewController : UIViewController) {
        if viewController == showViewController.first {
            if let firstViewController = showViewController.first {
                setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
            }
        }else if viewController == showViewController[1] {
            setViewControllers([showViewController[1]], direction: .forward, animated: false, completion: nil)
        }
    }
}

extension ScheduleVisitPageViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let ViewControllerIndex = showViewController.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = ViewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard showViewController.count > previousIndex else {
            return nil
        }
        
        return showViewController[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let ViewControllerIndex = showViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = ViewControllerIndex + 1
        let showViewControllerCount = showViewController.count
        
        guard showViewControllerCount != nextIndex else {
            return nil
        }
        
        guard showViewControllerCount > nextIndex else {
            return nil
        }
        
        return showViewController[nextIndex]
    }
}
