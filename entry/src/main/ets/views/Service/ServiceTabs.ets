import Card from "../../components/Card";
import { ICleaningServiceInfoItem } from "../../model/ServiceData";

@Component
export default struct ServiceTabs {
  @Prop serviceTabImage: string
  @Prop cleaningServiceInfo: ICleaningServiceInfoItem[]
  @State currentTabIndex: number = 0

  /**
   * 自定义Tab组件
   * @param index 当前选中Tab的索引值
   * @param title Tab标题
   * @param icon Tab图标
   * @param activeIcon 选中Tab图标
   */
  @Builder
  tabBarBuilder(index: number, name: string, subName: string) {
    Column() {
      Text(name)
        .fontSize(16)
        .fontColor('#000000')
        .fontWeight(FontWeight.Bold)

      Text(subName)
        .fontSize(12)
        .fontColor('#666666')
        .fontWeight(FontWeight.Medium)
      if (this.currentTabIndex === index) {
        Divider()
          .strokeWidth(4)
          .width(20)
          .color('#51BB9E')
      }
    }
  }

  // tab内容区
  @Builder
  Content() {
    Column({ space: 8 }) {
      this.NewArea()
      this.CleanRoom()
    }
  }

  // 新人专区
  @Builder
  NewArea() {
    Card({ cardPadding: 8 }) {
      Text() {
        Span('新人')
          .fontSize(16)
          .fontColor('#36D1A1')
          .fontWeight(FontWeight.Bold)
        Span('专区')
          .fontSize(16)
          .fontColor('#000000')
          .fontWeight(FontWeight.Bold)
      }

      Image(this.serviceTabImage)
        .width('100%')
        .height(90)
        .objectFit(ImageFit.Fill)
    }
  }

  // 洁净家
  @Builder
  CleanRoom() {
    Card({ cardPadding: 8 }) {
      Text('洁净家')
        .fontSize(16)
        .fontColor('#000000')
        .fontWeight(FontWeight.Bold)

      Row({ space: 8 }) {
        ForEach(this.cleaningServiceInfo, (item: ICleaningServiceInfoItem, index: number) => {
          Column({ space: 8 }) {
            Image(item.img)
              .width(152)
              .height(115)
              .objectFit(ImageFit.Fill)

            Text(item.title)
              .fontSize(16)
              .fontColor('#000000')
              .fontWeight(FontWeight.Bold)

            Text(item.subTitle)
              .fontSize(12)
              .fontColor('#666666')
              .fontWeight(FontWeight.Medium)

            Row({ space: 8 }) {
              Text('到手价')
                .fontSize(16)
                .fontColor('#666666')
                .fontWeight(FontWeight.Medium)

              Text('￥' + item.priceAfterDiscounts)
                .fontSize(16)
                .fontColor('#D9351A')
                .fontWeight(FontWeight.Medium)

              Text('￥' + item.originalPrice)
                .fontSize(10)
                .fontColor('#666666')
                .fontWeight(FontWeight.Medium)
                .decoration(
                  {
                    type: TextDecorationType.LineThrough,
                    color: '#666666',
                  }
                )
            }
          }
          .layoutWeight(1).alignItems(HorizontalAlign.Start)
        })
      }.margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }

  build() {
    Tabs() {
      TabContent() {
        this.Content()
      }.tabBar(this.tabBarBuilder(0, '会员精选', '专业服务'))

      TabContent() {
        this.Content()
      }.tabBar(this.tabBarBuilder(1, '居家保洁', '解放双手'))

      TabContent() {
        this.Content()
      }.tabBar(this.tabBarBuilder(2, '深层清洗', '高温蒸洗'))

      TabContent() {
        this.Content()
      }.tabBar(this.tabBarBuilder(3, '新居乔迁', '一站搬家'))
    }
    .onChange((index: number) => this.currentTabIndex = index)
    .barPosition(BarPosition.Start)
    .width('100%')
    .height(423)
    .margin({ top: 18 })
  }
}