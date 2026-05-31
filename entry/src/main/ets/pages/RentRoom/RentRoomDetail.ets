import { getRentRoomDetailApi } from '../../api/rentRoom'
import ScrollContainer from '../../components/ScrollContainer'
import {
  IDiscount,
  IDistanceInfo,
  IdQuery,
  IHouseholdItem,
  IHousePicture,
  IMetaInfo,
  IRentInfo,
  IRentRoomDetail,
  IRentTerm,
  ISupport,
  ITag
} from '../../model/RentRoomData'
import Book from '../../views/RentRoomDetail/Book'
import DiscountsList from '../../views/RentRoomDetail/DiscountsList'
import HouseholdItem from '../../views/RentRoomDetail/HouseholdItem'
import MetaInfo from '../../views/RentRoomDetail/MetaInfo'
import NavBar from '../../views/RentRoomDetail/NavBar'
import NavSwiper from '../../views/RentRoomDetail/NavSwiper'
import RentInfo from '../../views/RentRoomDetail/RentInfo'
import RentPrice from '../../views/RentRoomDetail/RentPrice'
import RentTerm from '../../views/RentRoomDetail/RentTerm'
import SupportList from '../../views/RentRoomDetail/SupportList'
import TagList from '../../views/RentRoomDetail/TagList'

@Entry
@Component
struct RentRoomDetail {
  @State room: Partial<IRentRoomDetail> = {}
  @State housePictureList: IHousePicture[] = []
  @State discountsList: IDiscount[] = []
  @State metaInfoList: IMetaInfo[] = []
  @State distanceInfo: IDistanceInfo = {} as IDistanceInfo
  @State tagList: ITag[] = []
  @State rentTerm: Partial<IRentTerm> = {}
  @State rentInfoList: IRentInfo[] = []
  @State householdList: IHouseholdItem[] = []
  @State supportList: ISupport[] = []

  aboutToAppear() {
    this.getRentRoomDetail()
  }

  async getRentRoomDetail() {
    const router = this.getUIContext().getRouter()
    const params = router.getParams() as IdQuery
    this.room = await getRentRoomDetailApi(params.id)
    this.housePictureList = this.room.housePicture || []
    this.discountsList = this.room.discounts || []
    this.metaInfoList = this.room.metaInfo || []
    this.tagList = this.room.tags || []
    this.rentTerm = this.room.rentTerm || {} as IRentTerm
    this.rentInfoList = this.room.rentInfo || []
    this.householdList = this.room.householdItem || []
    this.supportList = this.room.support || []
  }

  @Builder
  NavBarRender() {
    NavBar({ title: this.room.houseTitle })
  }

  @Builder
  ContentRender() {
    Column() {
      NavSwiper({ housePictureList: this.housePictureList })
      Column() {
        RentPrice({ rentPriceListing: this.room.rentPriceUnitListing, rentPriceUnit: this.room.rentPriceUnit })
        DiscountsList({ discountsList: $discountsList })
        MetaInfo({ metaInfoList: $metaInfoList, distanceInfo: $distanceInfo })
        TagList({ tagList: $tagList })
        RentTerm({ rentTerm: $rentTerm })
        RentInfo({ rentInfoList: $rentInfoList })
        HouseholdItem({ householdList: $householdList })
        SupportList({ supportList: $supportList })

        Button('查看全部内容')
          .type(ButtonType.Normal)
          .width('100%')
          .height(44)
          .fontSize(12)
          .fontColor('#ABA9AC')
          .margin({ top: 25 })
          .backgroundColor(Color.White)
          .border({ width: 1, color: '#F5F5F5', radius: 20 })
      }
    }.backgroundColor(Color.White)
    .padding({
      left: 10,
      right: 10
    })
  }

  build() {
    Stack() {
      ScrollContainer({
        navBuilder: () => {
          this.NavBarRender()
        },
        contentBuilder: () => {
          this.ContentRender()
        }
      })
      Book()
    }.height('100%')
    .alignContent(Alignment.Bottom)
  }
}