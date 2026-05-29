import { getDiscoverDataApi } from "../api/discover";
import ScrollContainer from "../components/ScrollContainer";
import { IBenefitItem, IDanMuListItem, IMainPostItem, IPostZoneItem } from "../model/DiscoverData";
import { IColor } from "../model/HomeData";
import Ad from "../views/Discover/Ad";
import BannerScroll from "../views/Discover/BannerScroll";
import Bg from "../views/Discover/Bg";
import NavBar from "../views/Discover/NavBar";
import Welfare from "../views/Discover/Welfare";

@Component
export default struct Discover {
  @StorageProp('topRectHeight') topRectHeight: number = 0
  @State bannerList: IDanMuListItem[] = []
  @State bannerList1: IDanMuListItem[] = []
  @State postZone: IPostZoneItem = {
    contentBlockList: [],
    mainPost: {} as IMainPostItem
  }
  @State benefits: IBenefitItem[] = []

  aboutToAppear(): void {
    this.getDiscoverData()
  }

  async getDiscoverData() {
    const discoverData = await getDiscoverDataApi()
    this.bannerList = discoverData.danMuList1
    this.bannerList1 = discoverData.danMuList2
    this.postZone = discoverData.postZone
    this.benefits = discoverData.benefits
  }

  @Builder
  NavBuilder($$: IColor) {
    NavBar({ bgColor: $$.bgColor })
  }

  @Builder
  ContentBuilder() {
    Stack() {

      Bg()

      Column() {
        Text('与100万用户发现生活').margin({ top: 44, left: 16 }).fontSize(14)

        Column({ space: 16 }) {
          BannerScroll({ bannerList: this.bannerList })
          BannerScroll({ bannerList: this.bannerList1 })

        }.alignItems(HorizontalAlign.Start)
        .padding({ top: this.getUIContext().px2vp(this.topRectHeight) + 10 })

        Ad({ postZone: this.postZone })

        Welfare({ benefits: this.benefits })

      }.alignItems(HorizontalAlign.Start)
      .padding({
        top: this.getUIContext().px2vp(this.topRectHeight),
        left: 10,
        right: 10
      })
      .width('100%')
    }
    .alignContent(Alignment.TopStart)
  }

  build() {
    ScrollContainer({
      navBuilder: this.NavBuilder,
      contentBuilder: () => {
        this.ContentBuilder()
      }
    })
  }
}