import { getServiceDataApi } from "../api/Service"
import ScrollContainer from "../components/ScrollContainer"
import { IColor } from "../model/HomeData"
import {
  ICleaningServiceInfoItem,
  IHomeServiceItem,
  INewcomerZoneItem,
  IServiceActivityItem,
  IVipServiceListItem
} from "../model/ServiceData"
import Bg from "../views/Service/Bg"
import DomesticService from "../views/Service/DomesticService"
import NavBar from "../views/Service/NavBar"
import ServiceCalendar from "../views/Service/ServiceCalendar"
import ServiceTabs from "../views/Service/ServiceTabs"
import VIP from "../views/Service/VIP"

@Component
export default struct Service {
  @State cleaningServiceInfo: ICleaningServiceInfoItem[] = []
  @State homeServiceList: IHomeServiceItem[] = []
  @State newcomerZone: INewcomerZoneItem = { img: '' }
  @State serviceActivity: IServiceActivityItem = {
    img: '',
    name: '',
    subTitle: '',
    title: ''
  }
  @State vipServiceList: IVipServiceListItem[] = []

  aboutToAppear(): void {
    this.getServiceData()
  }

  async getServiceData() {
    const serviceData = await getServiceDataApi()
    this.cleaningServiceInfo = serviceData.cleaningServiceInfo || []
    this.homeServiceList = serviceData.homeServiceList || []
    this.newcomerZone = serviceData.newcomerZone || { img: '' }
    this.serviceActivity = serviceData.serviceActivity || {
      img: '',
      name: '',
      subTitle: '',
      title: ''
    }
    this.vipServiceList = serviceData.vipServiceList || []
  }

  @Builder
  navBuilder($$: IColor) {
    NavBar({ fontColor: $$.fontColor, bgColor: $$.bgColor })
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        VIP({ vipServiceList: this.vipServiceList })
        DomesticService({ homeServiceList: this.homeServiceList })
        ServiceCalendar()
        ServiceTabs()
      }
      .padding({
        left: 10,
        right: 10
      })
    }.alignContent(Alignment.TopStart)
  }

  build() {
    ScrollContainer({
      navBuilder: this.navBuilder,
      contentBuilder: this.contentBuilder
    })
  }
}
