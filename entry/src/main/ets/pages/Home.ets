import Ad from "../views/Home/Ad"
import NavList from "../views/Home/NavList"
import PlanList from "../views/Home/PlanList"
import RoomRecommend from "../views/Home/RoomRecommend"
import SearchBar from "../views/Home/SearchBar"
import SwiperLayout from "../views/Home/SwiperLayout"
import TileList from "../views/Home/TileList"

@Component
export default struct Home {
  scrollY: number = 0;
  @State bgColor: string = 'rgba(255, 255, 255, 0)'
  @State fontColor: string = 'rgb(255, 255, 255)'
  // 处理滚动
  handleScroll = (xOffset: number, yOffset: number) => {
    this.scrollY += yOffset;
    if (this.scrollY < 0) {
      this.scrollY = 0;
    }
    this.calcColor()
  }
  // 计算颜色
  calcColor = () => {
    // 滚动计算的 scrollY 的值到达顶部可能不是 0，给点误差
    if (this.scrollY > 10) {
      this.bgColor = 'rgba(255, 255, 255, 1)'
      this.fontColor = 'rgb(0, 0, 0)'
    } else {
      this.bgColor = 'rgba(255, 255, 255, 0)'
      this.fontColor = 'rgb(255, 255, 255)'
    }
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Scroll() {
        Column() {
          Column() {
            SwiperLayout()
            NavList()
            TileList()
            PlanList()
            Ad()
            RoomRecommend()
          }
        }
      }.height('100%')
      .align(Alignment.TopStart)
      .onDidScroll(this.handleScroll)
      .scrollBar(BarState.Off)

      SearchBar({ bgColor: this.bgColor, fontColor: this.fontColor })
    }
  }
}