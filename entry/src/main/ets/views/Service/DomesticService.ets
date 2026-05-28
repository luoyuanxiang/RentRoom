import Card from "../../components/Card";
import { IHomeServiceItem } from "../../model/ServiceData";

@Component
export default struct DomesticService {
  @Prop homeServiceList: IHomeServiceItem[]

  @Builder
  renderBuilder() {
    Row() {
      Text('家庭服务')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#000000')

      Text('全部服务')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#999999')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)

    Grid() {

      ForEach(this.homeServiceList, (item: IHomeServiceItem) => {
        GridItem() {
          Column({ space: 10 }) {
            Image(item.icon)
              .width(24)
              .height(24)

            Text(item.title)
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#000000')
          }
        }
      }, (item: IHomeServiceItem, index: number) => item.title + '_' + item.icon)

    }
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr')
    .rowsGap(22)
    .columnsGap(18)
    .width('100%')
    .margin({ top: 20, bottom: 9 })
    .height(188)
  }

  build() {
    Column() {
      Card({
        cardPadding: 8,
        render: () => {
          this.renderBuilder()
        }
      })
    }
    .padding({
      top: 60
    })
  }
}