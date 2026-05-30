import { getProvinceListApi, getCityListApi, getDistrictListApi } from "../../../api/rentRoom";
import { IProvinceItem, ICityItem, IDistrictItem } from "../../../model/RentRoomData"
import { globalEmitter } from "../../../utils/emitter";

@Component
export default struct LocationRender {

  @State provinceList: IProvinceItem[] = []
  @State cityList: ICityItem[] = []
  @State districtList: IDistrictItem[] = []
  @State provinceCode: string = ''
  @State cityCode: string = ''
  @State districtCode: string = ''


  @Link currentSearchType: string
  // 暂存搜索条件
  @Link searchProvinceCode: string
  @Link searchCityCode: string
  @Link searchDistrictCode: string
  @Link isSearch: boolean

  aboutToAppear(): void {
    this.provinceCode = this.searchProvinceCode
    this.cityCode = this.searchCityCode
    this.districtCode = this.searchDistrictCode
    this.getProvinceList()
  }

  async getProvinceList() {
    const provinceList = await getProvinceListApi()
    this.provinceList = provinceList
    this.provinceCode = this.provinceCode || provinceList[0].code;
    this.getCityList()
  }

  async getCityList() {
    const cityList = await getCityListApi(this.provinceCode)
    this.cityList = cityList;
    this.cityCode = this.cityCode || cityList[0].code;
    this.getDistrictList()
  }

  async getDistrictList() {
    const districtList = await getDistrictListApi(this.cityCode)
    this.districtList = districtList
    this.districtCode = this.districtCode || districtList[0].code;
  }

  handleProvinceChange(provinceCode: string) {
    this.provinceCode = provinceCode;
    this.cityCode = ''
    this.districtCode = ''
    this.getCityList()
  }

  handleCityChange(cityCode: string) {
    this.cityCode = cityCode
    this.districtCode = ''
    this.getDistrictList()
  }

  handleDistrictChange(districtCode: string) {
    this.districtCode = districtCode;
  }

  locationSearch() {
    globalEmitter.emit('searchOptionsChange', {
      provinceCode: this.provinceCode,
      cityCode: this.cityCode,
      districtCode: this.districtCode,
    })
    this.isSearch = true
    this.locationClose()
  }

  locationClose() {
    if (this.isSearch) {
      this.searchProvinceCode = this.provinceCode
      this.searchCityCode = this.cityCode
      this.searchDistrictCode = this.districtCode
    } else {
      this.provinceCode = this.searchProvinceCode
      this.cityCode = this.searchCityCode
      this.districtCode = this.searchDistrictCode
    }
  }

  locationReset() {
    this.provinceCode = ''
    this.cityCode = ''
    this.districtCode = ''
    this.getProvinceList()
  }

  build() {
    Column() {
      Row() {
        List() {
          ForEach(this.provinceList, (item: IProvinceItem) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(12)
                  .fontColor(item.code === this.provinceCode ? '#67C0A8' : Color.Black)
              }
              .width('100%')
              .padding({
                left: 16,
                right: 16,
                top: 6,
                bottom: 6
              })
            }.onClick(() => {
              this.handleProvinceChange(item.code)
            })
          }, (item: IProvinceItem) => item.code)
        }.width(120).height('100%').backgroundColor('#F7F7F7')

        List() {
          ForEach(this.cityList, (item: ICityItem) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(12)
                  .fontColor(item.code === this.cityCode ? '#67C0A8' : Color.Black)
              }
              .width('100%')
              .padding({
                left: 16,
                right: 16,
                top: 6,
                bottom: 6
              })
            }.onClick(() => {
              this.handleCityChange(item.code)
            })
          }, (item: ICityItem) => item.code)
        }.width(120).height('100%').backgroundColor('#EBEBEB')

        List() {
          ForEach(this.districtList, (item: IDistrictItem) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(12)
                  .fontColor(item.code === this.districtCode ? '#67C0A8' : Color.Black)
              }
              .width('100%')
              .padding({
                left: 16,
                right: 16,
                top: 6,
                bottom: 6
              })
            }.onClick(() => {
              this.handleDistrictChange(item.code)
            })
          }, (item: IDistrictItem) => item.code)
        }.width(120).height('100%').backgroundColor('#E6E6E6')
      }.height(240).width('100%').backgroundColor(Color.White)

      Row({ space: 22 }) {
        Button('重置')
          .buttonStyles(95, '#F0F0F0', '#666666').onClick(() => {
          this.locationReset()
        })
        Button('查看房源')
          .buttonStyles(211, '#67C0A8', Color.White)
          .onClick(() => {
            this.locationSearch()
            this.currentSearchType = ''
          })
      }.height(58).width('100%').backgroundColor(Color.White).justifyContent(FlexAlign.Center)

      Row() {
      }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
        this.locationClose()
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