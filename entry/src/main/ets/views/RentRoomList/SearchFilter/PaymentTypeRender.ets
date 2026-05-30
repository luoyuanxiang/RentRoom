import { globalEmitter } from "../../../utils/emitter";

@Component
export default struct PaymentTypeRender {
  @Link currentSearchType: string
  @Link isPaymentTypeSearch: boolean
  @Link searchPaymentType: string
  @State paymentTypeList: string[] = ['月付', '季付', '半年付', '年付']
  @State paymentType: string = ''

  aboutToAppear(): void {
    this.paymentType = this.searchPaymentType
  }



  handlePaymentTypeChange(paymentType: string) {
    this.paymentType = paymentType
    this.searchPaymentType = paymentType
  }

  paymentTypeSearch() {
    globalEmitter.emit('searchOptionsChange', {
      paymentType: this.paymentType
    })
    this.isPaymentTypeSearch = true;
  }

  paymentTypeClose() {
    if (this.isPaymentTypeSearch) {
      this.searchPaymentType = this.paymentType
    } else {
      this.paymentType = this.searchPaymentType
    }
  }

  paymentTypeReset() {
    this.paymentType = ''
  }

  build() {
    Column() {
      Column() {
        Grid() {
          ForEach(this.paymentTypeList, (paymentType: string) => {
            GridItem() {
              Text(paymentType)
                .textStyles(this.paymentType === paymentType)
                .onClick(() => {
                  this.handlePaymentTypeChange(paymentType)
                })
            }
          }, (paymentType: string) => paymentType)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .height(100)

        Row({ space: 22 }) {
          Button('重置')
            .buttonStyles(95 as number, '#F0F0F0', '#666666')
            .onClick(() => {
              this.paymentTypeReset()
            })
          Button('查看房源')
            .buttonStyles(211, '#67C0A8', Color.White)
            .onClick(() => {
              this.paymentTypeSearch()
              this.currentSearchType = ''
            })
        }.height(58).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
      }
      .height(158)
      .width('100%')
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })

      Row() {
      }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
        this.currentSearchType = ''
      })
    }
  }
}

@Extend(Button)
function buttonStyles(width: number,
  bgColor: ResourceColor,
  fontColor: ResourceColor) {
  .type(ButtonType.Normal)
  .width(width)
  .height(26)
  .borderRadius(10)
  .fontSize(12)
  .backgroundColor(bgColor)
  .fontColor(fontColor)
}

@Extend(Text)
function textStyles(active: boolean) {
  .fontSize(12)
  .fontColor(active ? Color.White : '#666666')
  .width(94)
  .height(26)
  .backgroundColor(active ? '#67C0A8' : '#F0F0F0')
  .borderRadius(10)
  .textAlign(TextAlign.Center)
}