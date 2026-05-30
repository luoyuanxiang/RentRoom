import type {
  ICityItem,
  IDistrictItem,
  ILocationData,
  IPaymentTypeData,
  IProvinceItem,
  IRentPriceData,
  IRentPriceItem,
  ISortData,
  ISortItem,
} from '../../model/RentRoomData'

import { getCityListApi, getDistrictListApi, getProvinceListApi } from '../../api/rentRoom'

import { globalEmitter } from '../../utils/emitter'

@Component
export default struct SearchFilter {
  @State searchTypeList: string[] = ['地区', '租金', '付款方式', '排序']
  @State currentSearchType: string = ''

  getSearchTypeName(item: string): string {
    if (item === '地区') {
      return this.locationData.searchDistrictName || item
    } else if (item === '租金') {
      return this.rentPriceData.searchRentPrice?.text || item
    } else if (item === '付款方式') {
      return this.paymentTypeData.searchPaymentType || item
    } else if (item === '排序') {
      return this.sortData.sort?.text || item
    }
    return item
  }

  getSearchTypeNameColor(item: string): string {
    if (item === '地区') {
      return this.locationData.searchDistrictName ? '#FFFFFF' : '#000000'
    } else if (item === '租金') {
      return this.rentPriceData.searchRentPrice?.text ? '#FFFFFF' : '#000000'
    } else if (item === '付款方式') {
      return this.paymentTypeData.searchPaymentType ? '#FFFFFF' : '#000000'
    } else if (item === '排序') {
      return this.sortData.sort?.text && this.sortData.sort?.text !== '综合排序' ? '#FFFFFF' : '#000000'
    }
    return ''
  }

  chooseSearchType(searchType: string) {
    if (this.currentSearchType === searchType) {
      this.currentSearchType = ''
      return;
    }

    // 每个类型需要不同的处理
    if (searchType === '地区') {
      this.locationData.isSearch = false
      this.locationClose()
      this.getProvinceList()
    } else if (searchType === '租金') {
      this.rentPriceData.isSearch = false
      this.rentPriceClose()
    } else if (searchType === '付款方式') {
      this.paymentTypeData.isSearch = false
      this.paymentTypeClose()
    } else if (searchType === '排序') {
      this.sortClose()
    }

    // 更新
    this.currentSearchType = searchType;
  }

  // 地区
  @State locationData: ILocationData = {
    provinceList: [],
    cityList: [],
    districtList: [],
    provinceCode: '',
    cityCode: '',
    districtCode: '',
    isSearch: false,
    searchProvinceCode: '',
    searchCityCode: '',
    searchDistrictCode: '',
    searchDistrictName: ''
  }

  async getProvinceList() {
    const provinceList = await getProvinceListApi()
    this.locationData.provinceList = provinceList
    this.locationData.provinceCode = this.locationData.provinceCode || provinceList[0].code;
    this.getCityList()
  }

  async getCityList() {
    const cityList = await getCityListApi(this.locationData.provinceCode)
    this.locationData.cityList = cityList;
    this.locationData.cityCode = this.locationData.cityCode || cityList[0].code;
    this.getDistrictList()
  }

  async getDistrictList() {
    const districtList = await getDistrictListApi(this.locationData.cityCode)
    this.locationData.districtList = districtList
    this.locationData.districtCode = this.locationData.districtCode || districtList[0].code;
  }

  handleProvinceChange(provinceCode: string) {
    this.locationData.provinceCode = provinceCode;
    this.locationData.cityCode = ''
    this.locationData.districtCode = ''
    this.getCityList()
  }

  handleCityChange(cityCode: string) {
    this.locationData.cityCode = cityCode
    this.locationData.districtCode = ''
    this.getDistrictList()
  }

  handleDistrictChange(districtCode: string) {
    this.locationData.districtCode = districtCode;
  }

  locationSearch() {
    globalEmitter.emit('searchOptionsChange', {
      provinceCode: this.locationData.provinceCode,
      cityCode: this.locationData.cityCode,
      districtCode: this.locationData.districtCode,
    })
    this.locationData.isSearch = true;
    this.locationClose()
  }

  locationClose() {
    this.currentSearchType = ''
    if (this.locationData.isSearch) {
      this.locationData.searchProvinceCode = this.locationData.provinceCode
      this.locationData.searchCityCode = this.locationData.cityCode
      this.locationData.searchDistrictCode = this.locationData.districtCode
      this.locationData.searchDistrictName =
        this.locationData.districtList.find(item => item.code === this.locationData.districtCode)!.name
    } else {
      this.locationData.provinceCode = this.locationData.searchProvinceCode
      this.locationData.cityCode = this.locationData.searchCityCode
      this.locationData.districtCode = this.locationData.searchDistrictCode
    }
  }

  locationReset() {
    this.locationData.provinceCode = ''
    this.locationData.cityCode = ''
    this.locationData.districtCode = ''
    this.getProvinceList()
  }

  @Builder
  LocationRender() {
    Row() {
      List() {
        ForEach(this.locationData.provinceList, (item: IProvinceItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(sm())
                .fontColor(item.code === this.locationData.provinceCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: rvp(16),
              right: rvp(16),
              top: rvp(6),
              bottom: rvp(6)
            })
          }.onClick(() => {
            this.handleProvinceChange(item.code)
          })
        }, (item: IProvinceItem) => item.code)
      }.width(rvp(120)).height('100%').backgroundColor('#F7F7F7')

      List() {
        ForEach(this.locationData.cityList, (item: ICityItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(sm())
                .fontColor(item.code === this.locationData.cityCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: rvp(16),
              right: rvp(16),
              top: rvp(6),
              bottom: rvp(6)
            })
          }.onClick(() => {
            this.handleCityChange(item.code)
          })
        }, (item: ICityItem) => item.code)
      }.width(rvp(120)).height('100%').backgroundColor('#EBEBEB')

      List() {
        ForEach(this.locationData.districtList, (item: IDistrictItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(sm())
                .fontColor(item.code === this.locationData.districtCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: rvp(16),
              right: rvp(16),
              top: rvp(6),
              bottom: rvp(6)
            })
          }.onClick(() => {
            this.handleDistrictChange(item.code)
          })
        }, (item: IDistrictItem) => item.code)
      }.width(rvp(120)).height('100%').backgroundColor('#E6E6E6')
    }.height(rvp(240)).width('100%').backgroundColor(Color.White)

    Row({ space: rvp(22) }) {
      Button('重置')
        .buttonStyles(rvp(95), '#F0F0F0', '#666666').onClick(() => {
        this.locationReset()
      })
      Button('查看房源')
        .buttonStyles(rvp(211), '#67C0A8', Color.White)
        .onClick(() => {
          this.locationSearch()
        })
    }.height(rvp(58)).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)

    Row() {
    }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
      this.locationClose()
    })
  }

  // 租金
  @State rentPriceData: IRentPriceData = {
    rentPriceList: [
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
    ],
    isSearch: false,
  }

  handleRentPriceChange(rentPrice: IRentPriceItem) {
    this.rentPriceData.rentPrice = rentPrice
  }

  rentPriceSearch() {
    globalEmitter.emit('searchOptionsChange', {
      minRent: this.rentPriceData.rentPrice?.minRent,
      maxRent: this.rentPriceData.rentPrice?.maxRent,
    })
    this.rentPriceData.isSearch = true;
    this.rentPriceClose()
  }

  rentPriceClose() {
    this.currentSearchType = ''
    if (this.rentPriceData.isSearch) {
      this.rentPriceData.searchRentPrice = this.rentPriceData.rentPrice
    } else {
      this.rentPriceData.rentPrice = this.rentPriceData.searchRentPrice
    }
  }

  rentPriceReset() {
    this.rentPriceData.rentPrice = {
      id: 0,
      minRent: '',
      maxRent: '',
      text: '不限'
    }
  }

  @Builder
  RentPriceRender() {
    Column() {
      Grid() {
        ForEach(this.rentPriceData.rentPriceList, (rentPrice: IRentPriceItem) => {
          GridItem() {
            Text(rentPrice.text)
              .textStyles(this.rentPriceData.rentPrice?.id === rentPrice.id)
              .onClick(() => {
                this.handleRentPriceChange(rentPrice)
              })
          }
        }, (rentPrice: IRentPriceItem) => rentPrice.id + '')
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .height(rvp(194 - 58))

      Row({ space: rvp(22) }) {
        Button('重置')
          .buttonStyles(rvp(95), '#F0F0F0', '#666666')
          .onClick(() => {
            this.rentPriceReset()
          })
        Button('查看房源')
          .buttonStyles(rvp(211), '#67C0A8', Color.White)
          .onClick(() => {
            this.rentPriceSearch()
          })
      }.height(rvp(58)).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
    }
    .height(rvp(202))
    .width('100%')
    .backgroundColor(Color.White)
    .padding({ left: rvp(10), right: rvp(10) })

    Row() {
    }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
      this.rentPriceClose()
    })
  }

  // 付款方式
  @State paymentTypeData: IPaymentTypeData = {
    paymentTypeList: ['月付', '季付', '半年付', '年付'],
    isSearch: false,
    paymentType: '',
    searchPaymentType: ''
  }

  handlePaymentTypeChange(paymentType: string) {
    this.paymentTypeData.paymentType = paymentType
  }

  paymentTypeSearch() {
    globalEmitter.emit('searchOptionsChange', {
      paymentType: this.paymentTypeData.searchPaymentType
    })
    this.paymentTypeData.isSearch = true;
    this.paymentTypeClose()
  }

  paymentTypeClose() {
    this.currentSearchType = ''
    if (this.paymentTypeData.isSearch) {
      this.paymentTypeData.searchPaymentType = this.paymentTypeData.paymentType
    } else {
      this.paymentTypeData.paymentType = this.paymentTypeData.searchPaymentType
    }
  }

  paymentTypeReset() {
    this.paymentTypeData.paymentType = ''
  }

  @Builder
  PaymentTypeRender() {
    Column() {
      Grid() {
        ForEach(this.paymentTypeData.paymentTypeList, (paymentType: string) => {
          GridItem() {
            Text(paymentType)
              .textStyles(this.paymentTypeData.paymentType === paymentType)
              .onClick(() => {
                this.handlePaymentTypeChange(paymentType)
              })
          }
        }, (paymentType: string) => paymentType)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .height(rvp(100))

      Row({ space: rvp(22) }) {
        Button('重置')
          .buttonStyles(rvp(95) as number, '#F0F0F0', '#666666')
          .onClick(() => {
            this.paymentTypeReset()
          })
        Button('查看房源')
          .buttonStyles(rvp(211), '#67C0A8', Color.White)
          .onClick(() => {
            this.paymentTypeSearch()
          })
      }.height(rvp(58)).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)
    }
    .height(rvp(158))
    .width('100%')
    .backgroundColor(Color.White)
    .padding({ left: rvp(10), right: rvp(10) })

    Row() {
    }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
      this.paymentTypeClose()
    })
  }

  // 排序
  @State sortData: ISortData = {
    sortList: [
      {
        id: 1,
        icon: $r('app.media.sort'),
        text: '综合排序',
        orderBy: '面积',
        orderType: 'asc'
      },
      {
        id: 2,
        icon: $r('app.media.rent'),
        text: '价格从低到高',
        orderBy: '价格',
        orderType: 'asc'
      },
      {
        id: 3,
        icon: $r('app.media.rent'),
        text: '价格从高到低',
        orderBy: '价格',
        orderType: 'desc'
      },
      {
        id: 4,
        icon: $r('app.media.area'),
        text: '面积从大到小',
        orderBy: '面积',
        orderType: 'desc'
      },
      {
        id: 5,
        icon: $r('app.media.area'),
        text: '面积从小到大',
        orderBy: '面积',
        orderType: 'asc'
      },
    ],
    sort: {
      id: 1,
      icon: $r('app.media.sort'),
      text: '综合排序',
    },
  }

  handleSortChange(sort: ISortItem) {
    this.sortData.sort = sort
    this.sortSearch()
  }

  sortSearch() {
    globalEmitter.emit('searchOptionsChange', {
      orderBy: this.sortData.sort?.orderBy,
      orderType: this.sortData.sort?.orderType,
    })
    this.sortClose()
  }

  sortClose() {
    this.currentSearchType = ''
  }

  sortReset() {
    this.sortData.sort = {} as ISortItem
  }

  @Builder
  SortRender() {
    Column() {
      Column() {
        ForEach(this.sortData.sortList, (sort: ISortItem) => {
          Row({ space: rvp(8) }) {
            Image(sort.icon).width(rvp(16))
            Text(sort.text)
              .fontSize(sm())
              .fontColor(this.sortData.sort?.id === sort.id ? '#67C0A8' : '#666666')
          }.height(rvp(34)).onClick(() => {
            this.handleSortChange(sort)
          })
        }, (sort: ISortItem) => sort.id + '')
      }.padding({ left: rvp(20), top: rvp(8), bottom: rvp(16) }).alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .padding({ left: rvp(10), right: rvp(10) })
    .alignItems(HorizontalAlign.Start)


    Row() {
    }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
      this.sortClose()
    })
  }

  build() {
    Column() {
      Row() {
        ForEach(this.searchTypeList, (item: string) => {
          Row({ space: rvp(6) }) {
            Text(this.getSearchTypeName(item))
              .fontSize(sm())
              .fontColor(this.getSearchTypeNameColor(item))
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .constraintSize({
                maxWidth: rvp(60),
              })
            Image($r('app.media.arrow_down_3')).imageStyles()
          }.width('25%').height('100%').justifyContent(FlexAlign.Center).onClick(() => {
            this.chooseSearchType(item)
          })
        }, (item: string) => item)
      }.width('100%').height(rvp(44)).justifyContent(FlexAlign.SpaceBetween)

      if (this.currentSearchType === '地区') {
        this.LocationRender()
      }
      if (this.currentSearchType === '租金') {
        this.RentPriceRender()
      }
      if (this.currentSearchType === '付款方式') {
        this.PaymentTypeRender()
      }
      if (this.currentSearchType === '排序') {
        this.SortRender()
      }
    }
  }
}

@Extend(Image)
function imageStyles() {
  .width(rvp(12)).height(rvp(12)).objectFit(ImageFit.Fill)
}

@Extend(Button)
function buttonStyles(width: number,
  bgColor: ResourceColor,
  fontColor: ResourceColor) {
  .type(ButtonType.Normal)
  .width(width)
  .height(rvp(26))
  .borderRadius(rvp(10))
  .fontSize(sm())
  .backgroundColor(bgColor)
  .fontColor(fontColor)
}

@Extend(Text)
function textStyles(active: boolean) {
  .fontSize(sm())
  .fontColor(active ? Color.White : '#666666')
  .width(rvp(94))
  .height(rvp(26))
  .backgroundColor(active ? '#67C0A8' : '#F0F0F0')
  .borderRadius(rvp(10))
  .textAlign(TextAlign.Center)
}

function rvp(arg0: number): number {
  return arg0
}

function sm(): string | number {
  return 12
}
