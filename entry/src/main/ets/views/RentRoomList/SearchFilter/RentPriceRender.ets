import { IRentPriceItem } from "../../../model/RentRoomData"
import { globalEmitter } from "../../../utils/emitter";

@Component
export default struct RentPriceRender {
  // 租金
  @State rentPriceList: IRentPriceItem[] = [
    {
      id: 1,
      minRent: '0',
      maxRent: '0',
      text: '不限'
    },
    {
      id: 2,
      minRent: '0',
      maxRent: '1500',
      text: '1500元以下'
    },
    {
      id: 3,
      minRent: '1500',
      maxRent: '2500',
      text: '1500-2500元'
    },
    {
      id: 4,
      minRent: '2500',
      maxRent: '3500',
      text: '2500-3500元'
    },
    {
      id: 5,
      minRent: '3500',
      maxRent: '4500',
      text: '3500-4500元'
    },
    {
      id: 6,
      minRent: '4500',
      maxRent: '6000',
      text: '4500-6000元'
    },
    {
      id: 7,
      minRent: '6000',
      maxRent: '8000',
      text: '6000-8000元'
    },
    {
      id: 8,
      minRent: '8000',
      maxRent: '10000',
      text: '8000-10000元'
    },
    {
      id: 9,
      minRent: '10000',
      maxRent: '0',
      text: '10000元以上'
    }
  ]
  @State rentPrice: IRentPriceItem = {
    id: 1,
    minRent: '0',
    maxRent: '0',
    text: '不限'
  }
  // 需要父组件缓存的
  @Link isRentPriceSearch: boolean
  @Link searchRentPrice: IRentPriceItem
  @Link currentSearchType: string

  aboutToAppear(): void {
    this.rentPrice = this.searchRentPrice
  }

  handleRentPriceChange(rentPrice: IRentPriceItem) {
    this.rentPrice = rentPrice
    this.searchRentPrice = rentPrice
  }

  rentPriceSearch() {
    globalEmitter.emit('searchOptionsChange', {
      minRent: this.rentPrice.minRent,
      maxRent: this.rentPrice.maxRent,
    })
    this.isRentPriceSearch = true;
    this.rentPriceClose()
  }

  rentPriceClose() {
    if (this.isRentPriceSearch) {
      this.searchRentPrice = this.rentPrice
    } else {
      this.rentPrice = this.searchRentPrice
    }
  }

  rentPriceReset() {
    this.rentPrice = {
      id: 0,
      minRent: '',
      maxRent: '',
      text: '不限'
    }
  }
  build() {
    Column() {
      Column() {
        Grid() {
          ForEach(this.rentPriceList, (rentPrice: IRentPriceItem) => {
            GridItem() {
              Text(rentPrice.text)
                .textStyles(this.rentPrice?.id === rentPrice.id)
                .onClick(() => {
                  this.handleRentPriceChange(rentPrice)
                })
            }
          }, (rentPrice: IRentPriceItem) => rentPrice.id + '')
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .height(194 - 58)

        Row({ space: 22 }) {
          Button('重置')
            .buttonStyles(95, '#F0F0F0', '#666666')
            .onClick(() => {
              this.rentPriceReset()
            })
          Button('查看房源')
            .buttonStyles(211, '#67C0A8', Color.White)
            .onClick(() => {
              this.rentPriceSearch()
              this.currentSearchType = ''
            })
        }.height(58).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
      }
      .height(202)
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