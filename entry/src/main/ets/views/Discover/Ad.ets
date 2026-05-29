import Card from "../../components/Card";
import { IContentBlockListItem, IPostZoneItem } from "../../model/DiscoverData";

@Component
export default struct Ad {

  @Prop postZone: IPostZoneItem

  build() {
    Row({ space: 14 }) {
      Column() {
        Card({ cardPadding: 12 }) {
          Text(`${this.postZone.mainPost.followerNum}位小谷粒`)
            .fontSize(10)
            .fontColor('#666666')
            .margin({ top: 4, left: 4 })
          Text(this.postZone.mainPost.title).fontSize(26).fontWeight(700).margin({ top: 20, left: 4 })
          Column({ space: 10 }) {
            Row({ space: 8 }) {
              Image(this.postZone.mainPost.userAvatar).width(28).height(28).objectFit(ImageFit.Fill)
              Text(this.postZone.mainPost.userName).fontSize(12).fontColor('#636363')
            }

            Text(this.postZone.mainPost.postContent)
              .fontSize(12)
              .fontColor('#636363')
              .maxLines(4)
              .textOverflow({
                overflow: TextOverflow.Ellipsis
              })
          }
          .width('100%')
          .height(120)
          .padding(12)
          .backgroundColor('#F9F9F9')
          .borderRadius(10)
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 7 })
        }
      }.width(192).height('100%')

      Column({ space: 9 }) {
        ForEach(this.postZone.contentBlockList, (item: IContentBlockListItem) => {
          Image(item.img).width('100%').height(67).objectFit(ImageFit.Fill)
        })
      }.width(122).height('100%')
    }.width('100%').margin({ top: 19 }).height(218)
  }
}