import ScrollContainer from "../components/ScrollContainer"
import { IColor } from "../model/HomeData"
import Ad from "../views/Home/Ad"
import NavList from "../views/Home/NavList"
import PlanList from "../views/Home/PlanList"
import RoomRecommend from "../views/Home/RoomRecommend"
import SearchBar from "../views/Home/SearchBar"
import SwiperLayout from "../views/Home/SwiperLayout"
import TileList from "../views/Home/TileList"

@Component
export default struct Home {
  @Builder
  contentBuilder() {
    Column() {
      SwiperLayout()
      Column() {
        NavList()
        TileList()
        PlanList()
        Ad()
        RoomRecommend()
      }
      .padding({ left: 10, right: 10 })
    }
  }

  @Builder
  navBuilder($$: IColor) {
    SearchBar({ bgColor: $$.bgColor, fontColor: $$.fontColor })
  }

  build() {
    ScrollContainer({
      contentBuilder: () => {
        // 让 Builder 函数 this 指向组件实例
        this.contentBuilder()
      },
      navBuilder: this.navBuilder
    })
  }
}

