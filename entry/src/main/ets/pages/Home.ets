import { getHomeDataApi } from "../api/home"
import ScrollContainer from "../components/ScrollContainer"
import { BannerDataSource } from "../model/BannerDataSource"
import { IColor, INavItem, IPlanItem, ITileItem } from "../model/HomeData"
import Ad from "../views/Home/Ad"
import NavList from "../views/Home/NavList"
import PlanList from "../views/Home/PlanList"
import RoomRecommend from "../views/Home/RoomRecommend"
import SearchBar from "../views/Home/SearchBar"
import SwiperLayout from "../views/Home/SwiperLayout"
import TileList from "../views/Home/TileList"

@Component
export default struct Home {
  // 首页数据
  @State bannerList: BannerDataSource = new BannerDataSource()
  @State navList: INavItem[] = []
  @State tileList: ITileItem[] = []
  @State planList: IPlanItem[] = []
  @State adPicture: string = ''

  // 组件生命周期
  aboutToAppear() {
    this.getHomeData()
  }

  async getHomeData() {
    const homeData = await getHomeDataApi()
    this.bannerList.setList(homeData.bannerList)
    this.navList = homeData.navList;
    this.tileList = homeData.tileList;
    this.planList = homeData.planList;
    this.adPicture = homeData.adPicture;
  }

  @Builder
  contentBuilder() {
    Column() {
      SwiperLayout({ bannerList: this.bannerList.originDataArray })
      Column() {
        NavList({ navList: this.navList })
        TileList({ tileList: this.tileList })
        PlanList({ planList: this.planList })
        Ad({ adPicture: this.adPicture })
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

