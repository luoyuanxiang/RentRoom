import ScrollContainer from "../components/ScrollContainer"
import { IColor } from "../model/HomeData"
import Bg from "../views/My/Bg"
import NavBar from "../views/My/NavBar"
import Order from "../views/My/Order"
import PlanList from "../views/My/PlanList"
import TimePlan from "../views/My/TimePlan"
import UserInfo from "../views/My/UserInfo"

@Component
export default struct My {
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0

  @Builder
  navBuilder($$: IColor) {
    NavBar({ fontColor: $$.fontColor, bgColor: $$.bgColor })
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        UserInfo()
        TimePlan()
        Order()
        PlanList()

      }.padding({ left: 10, right: 10, top: 44 + this.getUIContext().px2vp(this.topRectHeight) })
    }.width('100%')
    .alignContent(Alignment.TopStart)
  }

  build() {
    ScrollContainer({
      contentBuilder: () => {
        this.contentBuilder()
      },
      navBuilder: this.navBuilder,
    })
  }
}