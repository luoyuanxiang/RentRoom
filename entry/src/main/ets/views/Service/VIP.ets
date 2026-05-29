import { IVipServiceListItem } from "../../model/ServiceData";

@Component
export default struct VIP {

  @Prop vipServiceList: IVipServiceListItem[]

  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0

  getUnit(name: string): string {
    console.log(name)
    switch (name) {
      case '余额':
        return ' 元';
      case '优惠券':
        return ' 张';
      case '会员特权':
        return ' 项';
      case '会员福利':
        return ' 个';
      default:
        return '';
    }
  }

  build() {
    Stack() {
      Image($r('app.media.vip_bg'))
        .width('100%')
        .height(99)

      Column({ space: 16 }) {
        Row({ space: 5 }) {
          Image($r('app.media.crown'))
            .width(18)
            .height(18)

          Text('开通谷粒卡享特权')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('sys.color.comp_background_list_card'))

          Blank()
          Image($r('app.media.vip'))
            .width(42)
            .height(18)
        }.width('100%')
        .padding({ left: 39, right: 41 })


        Row() {
          ForEach(this.vipServiceList, (vip: IVipServiceListItem) => {
            Column({ space: 5 }) {
              Text(vip.name).fontColor($r('sys.color.comp_background_list_card')).fontSize(14)
              Text() {
                Span(vip.content + '').fontSize(18).fontWeight(700).fontColor($r('sys.color.comp_background_list_card'))
                Span(this.getUnit(vip.name)).fontSize(12).fontColor($r('sys.color.comp_background_list_card'))
              }
            }
          }, (vip: IVipServiceListItem) => vip.name)
        }
        .padding({
          left: 39,
          right: 41
        })
        .justifyContent(FlexAlign.SpaceBetween).width('100%')

      }
      .padding({ top: 12 })
      .height('100%')

    }
    .height(99)
    .margin({ top: 54 + this.getUIContext().px2vp(this.topRectHeight) })
  }
}