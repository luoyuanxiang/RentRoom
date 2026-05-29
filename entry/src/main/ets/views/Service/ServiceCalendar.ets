import Card from "../../components/Card";
import { IServiceActivityItem } from "../../model/ServiceData";
import Calendar from "../../utils/calendar";

@Component
export default struct ServiceCalendar {

  @Prop serviceActivity: IServiceActivityItem

  @State calendarList: string[] = []

  aboutToAppear() {
    const calendar = new Calendar()
    this.calendarList = calendar.generatorCalendarList();
  }

  @Builder
  renderBuilder() {
    // 导航
    Row() {
      Text('服务日历')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.black'))

      Blank()
      Text('全部服务')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#999999')

      Image($r('app.media.arrow_right'))
        .width(9)
        .height(9)
    }.width('100%')

    // 日历
    Row() {
      ForEach(this.calendarList, (item: string, index: number) => {
        Row() {
          Text(item)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('sys.color.black'))

          Text('月')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#666666')
        }.backgroundColor(index === 2 ? '#CDFFD9' : '#FFF')
        .padding(index === 2 ? 6 : 0)
        .borderRadius(20)
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      top: 9,
      left: 10,
      right: 10
    })

    // 活动礼包
    Column({ space: 7 }) {
      Text(this.serviceActivity.name).fontSize(14).fontWeight(700)
      Row({ space: 10 }) {
        Image(this.serviceActivity.img)
          .width(100)
          .height(100)
          .objectFit(ImageFit.Fill)
          .borderRadius(20)
        Column() {
          Text(this.serviceActivity.title).fontSize(14).margin({ top: 7 })
          Text(this.serviceActivity.subTitle).fontSize(12).margin({ top: 7 })
          Row() {
            Text('立即参与')
              .borderRadius(20)
              .fontSize(12)
              .fontColor('#1F632F')
              .backgroundColor('#CDFFD9')
              .width(70)
              .height(24)
              .textAlign(TextAlign.Center)
          }.margin({ top: 22 }).padding({ right: 8 }).width('100%').justifyContent(FlexAlign.End)
        }.height(100).alignItems(HorizontalAlign.Start).layoutWeight(1)
      }.width('100%').height(100)
    }
    .width('100%')
    .height(140)
    .padding(8)
    .borderRadius(10)
    .margin({ top: 12 })
    .linearGradient({
      angle: 210,
      colors: [['#D0FFDB', 0], ['rgba(255, 255, 255, 1)', 0.29], ['rgba(255, 255, 255, 0)', 1]],
      repeating: false
    })
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      Card({
        cardPadding: 0,
        render: () => {
          this.renderBuilder()
        }
      })
    }.margin({ top: 8 })
  }
}