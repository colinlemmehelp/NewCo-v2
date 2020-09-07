//
//  ContentView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

//ANOTHER EXAMPLE FROM MEDIUM
//https://itnext.io/pageviewer-is-swiftui-aka-pageviewcontroller-8a53b1c37970
//SWIFTUI PAGER https://github.com/fermoya/SwiftUIPager#known-issues

//VIDEO ON HOW TO DO THIS
//https://www.youtube.com/watch?v=hr_B03mabYo

//BETTER IDEA ON HOW TO DO THIS
//https://www.youtube.com/watch?v=BK-8Ddtoa_w

struct ContentView: View {
    @Binding var bindingExample: String
    @Binding var response: String
    @Binding var ticketID: String
    @Binding var autoTag: String
    @Binding var agentTag: String
    @Binding var isAutoTagCorrect: Bool

    
    var body: some View {
        ContainerView(["Page 1", "Page 2", "Page 3"], bindingExample: $bindingExample, response: $response, ticketID: $ticketID, autoTag: $autoTag, agentTag: $agentTag, isAutoTagCorrect: $isAutoTagCorrect)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(["Page 1", "Page 2", "Page 3"], bindingExample: .constant("ticket10230"), response: .constant("response123"), ticketID: .constant("ticketiD123"), autoTag: .constant("autotag example"), agentTag: .constant("agent tag example"), isAutoTagCorrect: .constant(false))
    }
}



//now we need Title Pages
struct TitlePage: View {

    
    var title: String
    //var ticketID: Binding<String>
//    @Binding var ticketID: String
    
    var body: some View {
        Text(title)
    }
}


//now we want to create a container view for the viewcontrollers
struct ContainerView: View {

    var bindingExample: Binding<String>
    var response: Binding<String>
    var ticketID: Binding<String>
    var autoTag: Binding<String>
    var agentTag: Binding<String>
    var isAutoTagCorrect: Binding<Bool>
    
    var controllers: [UIHostingController<AnyView>]

    //need to initialize some pages first
    init(_ title: [String], bindingExample: Binding<String>, response: Binding<String>, ticketID: Binding<String>, autoTag: Binding<String>, agentTag: Binding<String>, isAutoTagCorrect: Binding<Bool>) {
        //, ticketID: Binding<String>
        //Mapping over our titels that we're passing in, then createing Hosting Controllers for each instance.. then we're passing a root view into that which brings in the titles
        self.bindingExample = bindingExample
        self.response = response
        self.ticketID = ticketID
        self.autoTag = autoTag
        self.agentTag = agentTag
        self.isAutoTagCorrect = isAutoTagCorrect
        
        
        self.controllers = []
        self.controllers.append(UIHostingController(rootView: AnyView(ChatThreadView(response: self.response, ticketID: self.ticketID, autoTag: self.autoTag, agentTag: self.agentTag, isAutoTagCorrect: self.isAutoTagCorrect))))
        self.controllers.append(UIHostingController(rootView: AnyView(OrderDetailsView(bindingExample: self.bindingExample))))
        //self.controllers.append(UIHostingController(rootView: AnyView(TitlePage(title: "Page 1"))))
        self.controllers.append(UIHostingController(rootView: AnyView(ShopifyActionsView(bindingExample: self.bindingExample))))
        

        //self.controllers.append(UIHostingController(rootView: TitlePage(title: "Page 3")))
        
//        self.controllers = title.map { UIHostingController(rootView: TitlePage(title: $0))
//        }
//        print(self.controllers[0])
    }
    
    var body: some View {
        PageViewController(controllers: self.controllers)
    }
}



struct PageViewController: UIViewControllerRepresentable {
        
    //Need to type this first or else you'll get an error
    typealias UIViewControllerType = UIPageViewController
    
    //create some viewControllers for the PageViewController to manage
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
    
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
    }
    
    //this uses the coordinator class
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //need to make it a UIPageViewControllerDataSource but you need a new class for that
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        //viewcontroller before
        
        //
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return nil
//                return self.parent.controllers.last
            } else {
                return self.parent.controllers[index-1]
            }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == self.parent.controllers.count - 1 {
                return nil
//                return self.parent.controllers.first
            } else {
                return self.parent.controllers[index+1]
            }
        }
        
        let parent: PageViewController
        
        //when we initialize this, it'll take in a pageviewcontroller instance
        init(_ parent: PageViewController) {
            self.parent = parent
        }
    }
    
    
}

