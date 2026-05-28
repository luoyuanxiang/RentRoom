import Home from './Home'
import See from './See'
import Service from './Service'
import Discover from './Discover'
import My from './My'

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 1

  // 底部导航栏高度
  @StorageProp('bottomRectHeight') bottomRectHeight: number = 0

  /**
   * 自定义Tab组件
   * @param index 当前选中Tab的索引值
   * @param title Tab标题
   * @param icon Tab图标
   * @param activeIcon 选中Tab图标
   */
  @Builder
  tabBarBuilder(index: number, title: string, icon: ResourceStr, activeIcon: ResourceStr) {
    Column() {
      Image(this.currentTabIndex == index ? activeIcon : icon)
        .width(28)
        .height(28)
      Text(title)
        .fontSize(12)
        .fontColor(this.currentTabIndex == index ? Color.Black : '#A0A0A0')
    }
  }

  build() {

    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentTabIndex }) {

        TabContent() {
          Home()
        }.tabBar(this.tabBarBuilder(0, '首页', $r('app.media.tabbar_home'), $r('app.media.tabbar_home_active')))

        TabContent() {
          See()
        }.tabBar(this.tabBarBuilder(1, '想看', $r('app.media.tabbar_see'), $r('app.media.tabbar_see_active')))

        TabContent() {
          Service()
        }.tabBar(this.tabBarBuilder(2, '服务', $r('app.media.tabbar_service'), $r('app.media.tabbar_service_active')))

        TabContent() {
          Discover()
        }.tabBar(this.tabBarBuilder(3, '发现', $r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active')))

        TabContent() {
          My()
        }.tabBar(this.tabBarBuilder(4, '我的', $r('app.media.tabbar_my'), $r('app.media.tabbar_my_active')))

      }
      .onChange((index: number) => {
        this.currentTabIndex = index
      })
      .vertical(false)
      .barMode(BarMode.Fixed)
      .scrollable(false)
      .width('100%')
      .height('100%')
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .padding({ bottom: this.getUIContext().px2vp(this.bottomRectHeight) })
  }
}