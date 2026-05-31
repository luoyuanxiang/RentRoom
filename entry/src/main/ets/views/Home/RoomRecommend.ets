import { getRoomRecommendListApi } from "../../api/home";
import { IRoomRecommendItem, ITagItem, RoomRecommendDataSource } from "../../model/RoomRecommendDataSource"

@Component
export default struct RoomRecommend {
  @State recommendList: RoomRecommendDataSource = new RoomRecommendDataSource()

  aboutToAppear() {
    this.getRoomRecommendList();
  }

  async getRoomRecommendList() {
    const roomRecommendList = await getRoomRecommendListApi();
    this.recommendList.setList(roomRecommendList)
  }

  @Builder
  navBuilder() {
    Row() {
      Row() {
        Text('周边房源')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('sys.color.black'))
        Text('推荐')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36D1A1')
      }.margin({ left: 10 })

      Blank()
      Row({ space: 6 }) {
        Text('更多推荐')
          .fontSize(10)
          .fontColor('#666666')
          .fontWeight(FontWeight.Medium)

        Image($r('app.media.gray_second'))
          .width(4)
          .height(8)
      }.margin({ right: 10 })
      .onClick(() => {
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/RentRoom/RentRoomList'
        }, () => {})
      })
    }.width('100%')
    .padding({
      top: 10,
      bottom: 10
    })
  }

  @Builder
  recommendListBuilder() {
    if (this.recommendList.totalCount() > 0) {
      Grid() {
        ForEach(this.recommendList.originDataArray, (item: IRoomRecommendItem) => {
          GridItem() {
            Stack() {
              Column() {

                Image(item.housePicture)
                  .width(160)
                  .height(120)

                Column() {

                  Row() {
                    Text() {
                      Span(item.rentPriceListing)
                        .fontSize(14)
                        .fontColor('#E03810')
                        .fontWeight(FontWeight.Medium)
                      Span(item.rentPriceUnit)
                        .fontSize(14)
                        .fontColor('#E03810')
                        .fontWeight(FontWeight.Medium)
                    }

                    Text(item.rentArea + '㎡')
                      .fontSize(10)
                      .fontColor('#999999')
                      .fontWeight(FontWeight.Medium)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%')


                  Text(item.houseTitle)
                    .fontSize(14)
                    .margin({ top: 1 })
                    .height(19)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })

                  Row({ space: 6 }) {
                    ForEach(item.tags.slice(0, 2), (tag: ITagItem, index) => {
                      Text(tag.name)
                        .padding({
                          top: 1,
                          bottom: 1,
                          left: 6,
                          right: 6
                        })
                        .fontColor(index === 0 ? $r('sys.color.white') : '#B3B3B3')
                        .backgroundColor(index === 0 ? '#36D1A1' : '#F7F7F7')
                        .fontSize(12)
                    }, (tag: ITagItem) => tag.name)
                  }.width('100%').margin({ top: 9 })

                }.padding(12).alignItems(HorizontalAlign.Start).height(91)

              }.width('100%')

              Image($r('app.media.room_text_bg')).width('100%').height(120)

              Row({ space: 5 }) {

                Image($r('app.media.location'))
                  .width(16)
                  .height(19)
                  .fillColor(Color.White)

                Text(item.address)
                  .fontSize(10)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Color.White)
              }
              .margin({ top: 90, left: 10 })
            }.alignContent(Alignment.TopStart).backgroundColor($r('sys.color.white'))

          }.height(210)
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/RentRoom/RentRoomDetail',
              params: {
                id: item.id
              }
            }, () => {})
          })
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(8)
      .rowsGap(8)
      .width('100%')
      .padding({
        left: 10,
        right: 10,
        top: 8,
        bottom: 8
      })
      .backgroundColor('#fff5f5f5')
      .borderRadius(20)
    }
  }

  build() {
    Column() {

      this.navBuilder()
      this.recommendListBuilder()

    }.width('100%')
  }
}