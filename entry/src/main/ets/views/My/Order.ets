import Card from "../../components/Card"
import { INavItem, INavList } from "../../model/NavListData"

@Component
export default struct Order {
  @State navList1: INavList = [
    {
      id: 1,
      text: '想看',
      icon: $r('app.media.my_icon_1')
    },
    {
      id: 2,
      text: '足迹',
      icon: $r('app.media.my_icon_2')
    },
    {
      id: 3,
      text: '约看',
      icon: $r('app.media.my_icon_3')
    },
    {
      id: 4,
      text: '拼租',
      icon: $r('app.media.my_icon_4')
    }
  ]
  @State navList2: INavList = [
    {
      id: 1,
      text: '合同',
      icon: $r('app.media.my_icon_5')
    },
    {
      id: 2,
      text: '账单',
      icon: $r('app.media.my_icon_6')
    },
    {
      id: 3,
      text: '订单',
      icon: $r('app.media.my_icon_7')
    },
    {
      id: 4,
      text: '评价',
      icon: $r('app.media.my_icon_8')
    },
    {
      id: 5,
      text: '钱包',
      icon: $r('app.media.my_icon_9')
    }
  ]

  build() {
    Column() {
      Card({ cardPadding: 10 }) {
        Row({ space: 38 }) {
          ForEach(this.navList1, (nav: INavItem) => {
            Row({ space: 4 }) {
              Image(nav.icon).width(16).height(16)
              Text(nav.text).fontSize(12).fontColor(Color.Black)
            }
          }, (nav: INavItem) => nav.id + '')
        }.width('100%').justifyContent(FlexAlign.Center)

        Divider().margin({ top: 16 })
        Row({ space: 39 }) {
          ForEach(this.navList2, (nav: INavItem) => {
            Column({ space: 6 }) {
              Image(nav.icon).width(16).height(16)
              Text('合同').fontSize(12).fontColor(Color.Black)
            }
          }, (nav: INavItem) => nav.id + '')
        }.margin({ top: 12 }).justifyContent(FlexAlign.Center).width('100%')
      }
    }.margin({ top: 10 })
  }
}