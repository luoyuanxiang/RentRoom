import Card from "../../components/Card"

@Component
export default struct PlanList {
  build() {
    Column() {
      Card({ cardPadding: 20 }) {
        Stack() {
          Column() {
            Row() {
              Text('我的家').fontSize(16).fontWeight(700)
              Row() {
              }
              .width(1)
              .height(12)
              .backgroundColor('#999999')
              .margin({ left: 14, right: 12 })

              Text('感谢你选择谷粒').fontSize(12).fontColor('#999999')
            }

            Text('选择谷粒，我们能为你提供').fontSize(14).margin({ top: 30 })
            Row() {
              Row({ space: 16 }) {
                Image($r('app.media.my_shenfen')).width(38)
                Column({ space: 2 }) {
                  Text('代办').fontSize(14)
                  Text('你还未进行实名认证').fontSize(12).fontColor('#999999')
                }.alignItems(HorizontalAlign.Start)
              }

              Image($r('app.media.arrow_right')).width(8).fillColor('#AEAEAE')
            }
            .padding(18)
            .margin({ top: 10 })
            .backgroundColor('#F7F7F7')
            .borderRadius(20)
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)

            Column() {
              Row({ space: 10 }) {
                Text('专属谷粒计划').fontSize(14)
                Text('你在谷粒的每一天都很珍贵').fontSize(10).fontColor('#999999')
              }

              Column({ space: 8 }) {
                Text('服务折扣').fontSize(12)
                Text('每住100天，折扣多一点').fontSize(10).fontColor('#999999')
              }.margin({ top: 30 }).alignItems(HorizontalAlign.Start)

              Column({ space: 8 }) {
                Text('免费换租').fontSize(12)
                Text('城市那么大，你不必讲究').fontSize(10).fontColor('#999999')
              }.margin({ top: 16 }).alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ top: 10 })
            .alignItems(HorizontalAlign.Start)
            .backgroundColor('#FFF8E4')
            .borderRadius(10)
            .padding(10)

            Column() {
              Row({ space: 10 }) {
                Text('专属谷粒计划').fontSize(14)
                Text('你在谷粒的每一天都很珍贵').fontSize(10).fontColor('#999999')
              }

              Column({ space: 8 }) {
                Text('服务折扣').fontSize(12)
                Text('每住100天，折扣多一点').fontSize(10).fontColor('#999999')
              }.margin({ top: 30 }).alignItems(HorizontalAlign.Start)

              Column({ space: 8 }) {
                Text('免费换租').fontSize(12)
                Text('城市那么大，你不必讲究').fontSize(10).fontColor('#999999')
              }.margin({ top: 16 }).alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ top: 10 })
            .alignItems(HorizontalAlign.Start)
            .backgroundColor('#DBFFF0')
            .borderRadius(10)
            .padding(10)

          }.alignItems(HorizontalAlign.Start)

          Image($r('app.media.my_people'))
            .width(45)
            .height(82)
            .objectFit(ImageFit.Fill)
            .margin({ top: 8, right: 18 })
        }.alignContent(Alignment.TopEnd)
      }
    }.margin({ top: 10 })
  }
}