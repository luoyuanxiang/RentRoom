import { IColor } from "../model/HomeData"
import { common } from "@kit.AbilityKit"

@Component
export default struct ScrollContainer {
  /**
   * 滚动内容
   */
  @BuilderParam contentBuilder: () => void = this.defaultBuilder
  /**
   * 导航栏
   */
  @BuilderParam navBuilder: ($$: IColor) => void = this.defaultBuilder
  @State scrollY: number = 0
  @State bgColor: ResourceColor = 'rgba(255, 255, 255, 0)'
  @State fontColor: ResourceColor = 'rgb(255, 255, 255)'
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0


  @Builder
  defaultBuilder() {
  }

  // 处理滚动
  handleScroll = (_scrollX: number, scrollY: number) => {
    // 更新并修正 scrollY 的值
    this.scrollY += scrollY;
    if (this.scrollY < 0) {
      this.scrollY = 0
    }
    this.calcColor();
  }
  // 计算颜色
  calcColor = () => {
    if (this.scrollY > 10) {
      this.bgColor = 'rgba(255, 255, 255, 1)'
      this.fontColor = 'rgb(0, 0, 0)'
    } else {
      this.bgColor = 'rgba(255, 255, 255, 0)'
      this.fontColor = 'rgb(255, 255, 255)'
    }
    this.setStatusBarStyle()
  }

  // 同步状态栏样式
  async setStatusBarStyle() {
    try {
      const uiContext = this.getUIContext();
      const hostContext = uiContext.getHostContext() as common.UIAbilityContext;
      if (!hostContext) return;
      const windowClass = hostContext.windowStage.getMainWindowSync()
      const isDark = this.scrollY <= 10
      windowClass.setWindowSystemBarProperties({
        statusBarContentColor: isDark ? '#FFFFFF' : '#000000',
        navigationBarContentColor: isDark ? '#FFFFFF' : '#000000'
      }).catch((err: Error) => {
        // TODO: Implement error handling.
        console.error('设置状态栏样式失败1',  err.message)
      })
    } catch (error) {
      // TODO: Implement error handling.
      console.error('设置状态栏样式失败2', error.message)
    }

  }

  build() {
    Stack() {
      // 滚动内容
      Scroll() {
        Column() {
          this.contentBuilder()
        }
      }
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .backgroundColor(Color.Transparent)
      .onDidScroll(this.handleScroll)

      // 搜索栏
      Column() {
        // 渲染头部导航，按引用传递
        this.navBuilder({ fontColor: this.fontColor, bgColor: this.bgColor })

      }.backgroundColor(this.bgColor).padding({ top: this.getUIContext().px2vp(this.topRectHeight)})
    }.height('100%')
    .alignContent(Alignment.TopStart)
  }
}
