import Foundation
import Publish
import Plot
import HighlightJSPublishPlugin

// This type acts as the configuration for your website.
struct Guanerlin: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case index
        case posts
        case project
        case tags
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Guanerlin"
    var description = "Speak less, do more, think diligently, act SWIFTly"
    var language: Language { .english }
    var imagePath: Path? { Path("images") }
}

// This will generate your website using the built-in Foundation theme:
// try Guanerlin().publish(withTheme: .foundation)

try Guanerlin().publish(
    using: [
        //使用ink modifier的plugins要在addMarkdonwFiles之前先加入.
        //需要注意modifier的添加顺序
        .installPlugin(.highlightJS()), //语法高亮
        .addModifier(modifier: bilibili,modifierName:"Bilibili Video"), //bilibili视频
        .copyResources(),
        .addMarkdownFiles(),
        .setSctionTitle(), //修改section 标题
        .installPlugin(.setDateFormatter()), //设置时间显示格式
        .installPlugin(.countTag()), //计算tag的数量,tag必须在 addMarkDownFiles 之后,否则alltags没有值
        .installPlugin(.colorfulTags(defaultClass: "tag", variantPrefix: "variant", numberOfVariants: 8)), //给tag多种颜色
        .sortItems(by: \.date, order: .descending), //对所有文章排序
        .generateHTML(withTheme: .fatTheme),
//        .installPlugin(.rssSetting(including:[.posts,.project])),
        .generateRSSFeed(
            including: [.posts,.project],
            itemPredicate: nil
        ),
        .generateSiteMap(),
        .unwrap(.gitHub("guanerlin/guanerlin.github.io", useSSH: false), PublishingStep.deploy)
    ]
)
