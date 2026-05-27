import { IRoomRecommendItem, ITagItem } from "../../model/RoomRecommendDataSource"

@Component
export default struct RoomRecommend {

  @State recommendList: IRoomRecommendItem[] = [
    {
      "id": "BJ1836395752604041216",
      "housePicture": "http://192.168.101.24:6060/public/room55.jpg",
      "tags": [
        {
          "name": "官方核验"
        },
        {
          "name": "精装"
        },
        {
          "name": "集中供暖"
        },
        {
          "name": "随时看房"
        }
      ],
      "houseTitle": "整租·双龙南里 2室1厅 东/西",
      "address": "朝阳·华威桥",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "5300",
      "rentArea": "60.57"
    },
    {
      "id": "BJ1790593116399468544",
      "housePicture": "http://192.168.101.24:6060/public/room97.jpg",
      "tags": [
        {
          "name": "官方核验"
        },
        {
          "name": "近地铁"
        },
        {
          "name": "集中供暖"
        }
      ],
      "houseTitle": "整租·石榴园北里小区 3室1厅 东/西",
      "address": "丰台·刘家窑",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "6000",
      "rentArea": "74.00"
    },
    {
      "id": "BJ1849651164342124544",
      "housePicture": "http://192.168.101.24:6060/public/room38.jpg",
      "tags": [
        {
          "name": "租住保障"
        },
        {
          "name": "月租"
        },
        {
          "name": "精装"
        },
        {
          "name": "集中供暖"
        },
        {
          "name": "押一付一"
        },
        {
          "name": "随时看房"
        }
      ],
      "houseTitle": "合租·香山新园A区 3居室 北卧",
      "address": "海淀·西山",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "2200",
      "rentArea": "12.00"
    },
    {
      "id": "BJ1794637777627774976",
      "housePicture": "http://192.168.101.24:6060/public/room60.jpg",
      "tags": [
        {
          "name": "精装"
        },
        {
          "name": "集中供暖"
        },
        {
          "name": "押一付一"
        },
        {
          "name": "随时看房"
        }
      ],
      "houseTitle": "合租·复兴门北大街 3居室 北卧",
      "address": "西城·月坛",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "3590",
      "rentArea": "8.10"
    },
    {
      "id": "BJ1812033838247837696",
      "housePicture": "http://192.168.101.24:6060/public/room59.jpg",
      "tags": [
        {
          "name": "官方核验"
        },
        {
          "name": "近地铁"
        },
        {
          "name": "精装"
        }
      ],
      "houseTitle": "整租·那尔水晶城 1室1厅 南/北",
      "address": "大兴·枣园",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "4000",
      "rentArea": "77.00"
    },
    {
      "id": "BJ1776946003492995072",
      "housePicture": "http://192.168.101.24:6060/public/room76.jpg",
      "tags": [
        {
          "name": "精装"
        },
        {
          "name": "集中供暖"
        },
        {
          "name": "押一付一"
        }
      ],
      "houseTitle": "整租·定福庄西街 1室1厅 南",
      "address": "朝阳·定福庄",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "4990",
      "rentArea": "41.00"
    },
    {
      "id": "BJ1812782814240702464",
      "housePicture": "http://192.168.101.24:6060/public/room48.jpg",
      "tags": [
        {
          "name": "官方核验"
        },
        {
          "name": "近地铁"
        },
        {
          "name": "集中供暖"
        }
      ],
      "houseTitle": "整租·科学园南里七区 2室1厅 南/北",
      "address": "朝阳·南沙滩",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "7300",
      "rentArea": "61.00"
    },
    {
      "id": "BJ1823008714492215296",
      "housePicture": "http://192.168.101.24:6060/public/room68.jpg",
      "tags": [
        {
          "name": "官方核验"
        },
        {
          "name": "精装"
        },
        {
          "name": "集中供暖"
        }
      ],
      "houseTitle": "整租·茂华景公馆 3室2厅 西南/北",
      "address": "石景山·杨庄",
      "rentPriceUnit": "元/月",
      "rentPriceListing": "15500",
      "rentArea": "166.88"
    }
  ]

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
    }.width('100%')
  }

  @Builder
  recommendListBuilder() {
    Grid() {
      ForEach(this.recommendList, (item: IRoomRecommendItem) => {
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

  build() {
    Column() {

      this.navBuilder()
      this.recommendListBuilder()

    }.width('100%')
  }
}