//
//  File.swift
//  
//
//  Created by Yang Xu on 2021/1/22.
//


import Foundation
import Publish

// 如果直接设置 SectionID的raw值的话,文件的目录名也会发生变化.还是这种方式灵活度更大

extension PublishingStep where Site == Guanerlin {
    static func setSctionTitle() -> Self {
        .step(named: "setSctionTitle" ){ content in
            content.mutateAllSections { section in
                switch section.id {
                case .index:
                    section.title = "Home"
                case .posts:
                    section.title = "Posts"
                case .project:
                    section.title = "APP"
                case .about:
                    section.title = "About"
                case .tags:
                    section.title = "Tags"
                }
            }
        }
    }
}




