import Card from "../../components/Card";
import { IBenefitItem } from "../../model/DiscoverData";

@Component
export default struct Welfare {

  @Prop benefits: IBenefitItem[]

  build() {
    Column({ space: 10 }) {
      ForEach(this.benefits, (item: IBenefitItem) => {
        Card({ cardPadding: 12 }) {
          Text("小谷粒福利")
            .width(80)
            .height(24)
            .borderRadius(23)
            .backgroundColor('#CDFFD9')
            .fontSize(12)
            .fontColor('#1F632F')
            .textAlign(TextAlign.Center)
          Text(item.title)
            .fontSize(26)
            .fontColor('#FF000000')
            .fontWeight(700)
            .margin({ top: 18, left: 4 })
          Image(item.img)
            .width('100%')
            .height(143)
            .objectFit(ImageFit.Fill)
            .margin({ top: 9, left: 4, bottom: 6 })
        }
      })
    }.margin({ top: 10 })
  }
}