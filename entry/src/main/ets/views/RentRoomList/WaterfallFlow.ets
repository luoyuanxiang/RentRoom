import { getRentRoomListApi } from "../../api/rentRoom";
import Empty from "../../components/Empty";
import { IGetRentRoomListParams, IRentRoomItem, RentRoomListDataSource } from "../../model/RentRoomData";
import { ITagItem } from "../../model/RoomRecommendDataSource";
import { globalEmitter } from "../../utils/emitter";

@Component
export default struct WaterfallFlow {
  @State rootRoomListDataSource: RentRoomListDataSource = new RentRoomListDataSource()
  @State total: number = 0
  // 1. 定义搜索条件
  @State searchOptions: IGetRentRoomListParams = {
    page: 1,
    limit: 10
  }
  @State isEnd: boolean = false

  aboutToAppear() {
    this.getRentRoomList()
    this.registerGlobalEmitter()
  }

  registerGlobalEmitter() {
    globalEmitter.on('searchOptionsChange', async (searchOptions: Partial<IGetRentRoomListParams>) => {
      this.searchOptions.provinceCode = searchOptions.provinceCode
      this.searchOptions.cityCode = searchOptions.cityCode
      this.searchOptions.districtCode = searchOptions.districtCode
      this.searchOptions.maxRent = searchOptions.maxRent
      this.searchOptions.minRent = searchOptions.minRent
      this.searchOptions.orderBy = searchOptions.orderBy
      this.searchOptions.paymentType = searchOptions.paymentType
      this.searchOptions.page = 1;
      this.searchOptions.limit = 10;
      this.getRentRoomList()
    })
  }

  async getRentRoomList() {
    const res = await getRentRoomListApi(this.searchOptions)
    if (this.searchOptions.page === 1) {
      this.rootRoomListDataSource.setList([])
    }
    res.records.forEach((item: IRentRoomItem) => {
      if (item.activity) {
        item.activity.textContent = Reflect.get(item.activity, '#text')
      }
      this.rootRoomListDataSource.setData(item)
    })
    this.total = res.total
  }

  // 2. 定义回调函数
  loadMore = () => {
    if (this.total <= this.rootRoomListDataSource.totalCount()) {
      this.isEnd = true
    }
    this.searchOptions.page++;
    this.getRentRoomList()
  }

  @Builder
  footer() {
    Row({ space: 10 }) {
      if (this.isEnd) {
        Text('到底了').fontSize(12)
          .margin({ top: 10 })
      } else {
        Refresh({ refreshing: true })
        Row({ space: 5 }) {
          Text('加载数据中...').fontSize(12)
            .margin({ top: 10 })
        }.width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    if (this.total > 0) {
      Column() {
        WaterFlow(
          {
            footer: () => {
              this.footer()
            }
          }
        ) {
          LazyForEach(this.rootRoomListDataSource, (room: IRentRoomItem) => {
            FlowItem() {
              Stack() {
                Column() {
                  if (room.activity) {
                    Column() {
                      Row() {
                        Image(room.activity.icon).width(26)
                        Text(room.activity.title).fontSize(14).fontWeight(700)
                      }

                      Text(room.activity.textContent)
                        .fontColor(room.activity.textColor)
                        .backgroundColor(room.activity.textBackGroundColor)
                        .padding({
                          top: 4,
                          bottom: 4,
                          left: 8,
                          right: 8
                        })
                        .borderRadius(21)
                        .fontSize(10)
                        .margin({ top: 3 })
                      Image(room.housePicture)
                        .width('100%')
                        .height(170)
                        .borderRadius(10)
                        .objectFit(ImageFit.Fill)
                        .margin({ top: 5 })
                    }.padding({ left: 10, right: 10, top: 10 }).alignItems(HorizontalAlign.Start)
                  } else {
                    Image(room.housePicture).width('100%').height(120).objectFit(ImageFit.Fill).borderRadius({
                      topLeft: 10,
                      topRight: 10
                    })
                  }
                  Column() {
                    Row() {
                      Text() {
                        Span(room.rentPriceListing).fontSize(14).fontColor('#E03810')
                        Span(room.rentPriceUnit).fontSize(12).fontColor('#E03810')
                      }.height(22)

                      Text(room.rentArea + '㎡').fontSize(10).fontColor(Color.Gray)
                    }.width('100%').justifyContent(FlexAlign.SpaceBetween)

                    Text(room.houseTitle)
                      .fontSize(12)
                      .margin({ top: 1 })
                      .height(19)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Row({ space: 6 }) {
                      ForEach(room.tags.slice(0, 2), (tag: ITagItem, index) => {
                        Text(tag.name)
                          .padding({
                            top: 1,
                            bottom: 1,
                            left: 6,
                            right: 6,
                          })
                          .fontColor(index === 0 ? Color.White : '#B3B3B3')
                          .backgroundColor(index === 0 ? '#36D1A1' : Color.Gray)
                          .fontSize(10)
                      }, (tag: ITagItem) => tag.name)
                    }.width('100%').margin({ top: 9 })
                  }.padding(12).alignItems(HorizontalAlign.Start).height(90)
                }.width('100%').alignItems(HorizontalAlign.Start)

                if (!room.activity) {
                  Image($r('app.media.room_text_bg')).width('100%').height(120)
                  Row({ space: 6 }) {
                    Image($r('app.media.location')).width(12).height(14)
                    Text(room.address).fontSize(10).fontColor(Color.White)
                  }.margin({ left: 8, top: 99 })
                }
              }
              .alignContent(Alignment.TopStart)
              .backgroundColor(Color.White)
              .borderRadius(10)
              .width(165)
              .height('100%')
            }.height(room.activity ? 320 : 210)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({
                url: 'pages/RentRoom/RentRoomDetail',
                params: {
                  id: room.id
                }
              }, () => {})
            })

          }, (room: IRentRoomItem) => room.id)
        }
        .columnsTemplate("1fr 1fr")
        .columnsGap(10)
        .rowsGap(10)
        .width('100%')
        // 边缘效果：弹簧回弹效果
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        .layoutDirection(FlexDirection.Column)
        .padding({ left: 10, right: 10, top: 10 })
        .onReachEnd(this.loadMore) // 1. 绑定触底事件
      }
    } else {
      Column() {
        Empty({ title: '抱歉，没有搜索到你想要的房子。' }).margin({ top: -138 })
      }.height('100%').justifyContent(FlexAlign.Center)
    }
  }
}