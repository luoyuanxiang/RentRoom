import { getProvinceListApi, getCityListApi, getDistrictListApi } from "../../api/rentRoom"
import {
  IProvinceList,
  ICityList,
  IDistrictList,
  ICityItem,
  IDistrictItem,
  IProvinceItem,
  ILocationData
} from "../../model/RentRoomData"
import { globalEmitter } from "../../utils/emitter"

interface IArrowDownType {
  icon: ResourceStr;
  active: ResourceStr;
}

@Component
export default struct SearchFilter {
  @State searchTypeList: string[] = ['地区', '租金', '付款方式', '排序']
  @State currentSearchType: string = ''
  // 3. 地区数据
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

  @State arrowDown: ResourceStr = $r('app.media.arrow_down_3')
  @State arrowDownActive: ResourceStr = $r('app.media.arrow_down_3_active')
  @State arrowDownArr: ResourceStr[] = [
    $r('app.media.arrow_down_3'),
    $r('app.media.arrow_down_3'),
    $r('app.media.arrow_down_3'),
    $r('app.media.arrow_down_3')
  ]
  @State searchTypeIndex: number = 0

  getSearchTypeName(item: string) {
    if (item === '地区') {
      return this.locationData.searchDistrictName || item
    }
    return item
  }

  getSearchTypeNameColor(item: string) {
    if (item === '地区') {
      return this.locationData.searchDistrictName ? '#67C0A8' : '#000000'
    }
    return item
  }

  chooseSearchType(searchType: string) {
    if (this.currentSearchType === searchType) {
      this.currentSearchType = ''
      this.arrowDownArr[this.searchTypeIndex] = $r('app.media.arrow_down_3')
      return;
    }

    // 每个类型需要不同的处理
    if (searchType === '地区') {
      this.locationData.isSearch = false
      this.locationClose()
      this.getProvinceList()
    }

    // 更新
    this.currentSearchType = searchType;
  }

  // 获取省市区数据方法
  async getProvinceList() {
    const provinceList = await getProvinceListApi()
    this.locationData.provinceList = provinceList || []
    if (this.locationData.provinceList.length > 0) {
      this.locationData.provinceCode = provinceList[0].code || ''
    }
    this.getCityList()
  }

  async getCityList() {
    const cityList = await getCityListApi(this.locationData.provinceCode)
    this.locationData.cityList = cityList;
    if (this.locationData.cityList.length > 0) {
      this.locationData.cityCode = cityList[0].code || ''
    }
    this.getDistrictList()
  }

  async getDistrictList() {
    const districtList = await getDistrictListApi(this.locationData.cityCode)
    this.locationData.districtList = districtList
    if (this.locationData.districtList.length > 0) {
      this.locationData.districtCode = districtList[0].code || ''
    }
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
        this.locationData.districtList.find(item => item.code === this.locationData.districtCode)?.name || ''
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
                .fontSize(12)
                .fontColor(item.code === this.locationData.provinceCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: 16,
              right: 16,
              top: 6,
              bottom: 6
            })
          }.onClick(() => {
            this.locationData.provinceCode = item.code;
            this.getCityList()
          })
        }, (item: IProvinceItem) => item.code)
      }.width(120).height('100%').backgroundColor('#666666').scrollBar(BarState.Off)

      List() {
        ForEach(this.locationData.cityList, (item: ICityItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(12)
                .fontColor(item.code === this.locationData.cityCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: 16,
              right: 16,
              top: 6,
              bottom: 6
            })
          }.onClick(() => {
            this.locationData.cityCode = item.code || ''
            this.getDistrictList()
          })
        }, (item: ICityItem) => item.code)
      }.width(120).height('100%').backgroundColor('#EBEBEB').scrollBar(BarState.Off)

      List() {
        ForEach(this.locationData.districtList, (item: IDistrictItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(12)
                .fontColor(item.code === this.locationData.districtCode ? '#67C0A8' : Color.Black)
            }
            .width('100%')
            .padding({
              left: 16,
              right: 16,
              top: 6,
              bottom: 6
            })
          }.onClick(() => {
            this.locationData.districtCode = item.code;
          })
        }, (item: IDistrictItem) => item.code)
      }.width(120).height('100%').backgroundColor('#E6E6E6').scrollBar(BarState.Off)
    }.height(240).width('100%').backgroundColor(Color.White)

    Row({ space: 22 }) {
      Button('重置')
        .buttonStyles(95, '#F0F0F0', '#67C0A8').onClick(() => {
        this.locationReset()
      })
      Button('查看房源')
        .buttonStyles(211, '#67C0A8', '#fff')
        .onClick(() => {
          this.locationSearch()
        })
    }.height(58).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)

    // 遮罩层
    Row() {
    }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
      this.locationSearch()
    })
  }

  @Builder
  RentPriceRender() {
    Text('RentPriceRender')
  }

  @Builder
  PaymentTypeRender() {
    Text('PaymentTypeRender')
  }

  @Builder
  SortRender() {
    Text('SortRender')
  }

  build() {
    Column() {
      Row() {
        ForEach(this.searchTypeList, (item: string, index: number) => {
          Row({ space: 6 }) {
            Text(item)
              .fontSize(12)
              .fontColor(Color.Black)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .constraintSize({
                maxWidth: 60,
              })
            Image(this.arrowDownArr[index]).imageStyles()
          }.width('25%').height('100%').justifyContent(FlexAlign.Center).onClick(() => {
            this.searchTypeIndex = index
            this.arrowDownArr[index] = $r('app.media.arrow_down_3_active')
            this.chooseSearchType(item)
          })
        }, (item: string) => item)
      }.width('100%').height(44).justifyContent(FlexAlign.SpaceBetween)

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
  .width(20).height(20).objectFit(ImageFit.Fill)
}

@Extend(Button)
function buttonStyles(width: number, bgColor: string | Resource, fontColor: string | Resource) {
  .type(ButtonType.Normal)
  .width(width)
  .height(26)
  .borderRadius(20)
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
  .backgroundColor(active ? '#67C0A8' : '#F7F7F7')
  .borderRadius(20)
  .textAlign(TextAlign.Center)
}