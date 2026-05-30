import type {
  IRentPriceItem, ISortItem,
} from '../../model/RentRoomData'
import LocationRender from './SearchFilter/LocationRender'
import RentPriceRender from './SearchFilter/RentPriceRender'
import PaymentTypeRender from './SearchFilter/PaymentTypeRender'
import SortRender from './SearchFilter/SortRender'

@Component
export default struct SearchFilter {
  @State searchTypeList: string[] = ['地区', '租金', '付款方式', '排序']
  @State currentSearchType: string = ''
  // 缓存子组件地区搜索条件
  @State searchProvinceCode: string = ''
  @State searchCityCode: string = ''
  @State searchDistrictCode: string = ''
  @State isSearch: boolean = false
  // 缓存子组件租金搜索条件
  @State isRentPriceSearch: boolean = false
  @State searchRentPrice: IRentPriceItem = {
    id: 1,
    minRent: '0',
    maxRent: '0',
    text: '不限'
  }
  // 缓存子组件付款方式搜索条件
  @State isPaymentTypeSearch: boolean = false
  @State searchPaymentType: string = ''
  // 缓存子组件排序搜索条件
  @State searchSort: ISortItem = {
    id: 1,
    icon: $r('app.media.sort'),
    text: '综合排序',
  }

  build() {
    Column() {
      Row() {
        ForEach(this.searchTypeList, (item: string) => {
          Row({ space: 6 }) {
            Text(item)
              .fontSize(10)
              .fontColor('#000000')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .constraintSize({
                maxWidth: 60,
              })
            Image(this.currentSearchType === item ? $r('app.media.arrow_down_3_active') : $r('app.media.arrow_down_3'))
              .imageStyles()
          }.width('25%').height('100%').justifyContent(FlexAlign.Center).onClick(() => {
            this.currentSearchType = item
          })
        }, (item: string) => item)
      }.width('100%').height(44).justifyContent(FlexAlign.SpaceBetween)

      if (this.currentSearchType === '地区') {
        LocationRender({
          currentSearchType: $currentSearchType,
          searchProvinceCode: $searchProvinceCode,
          searchCityCode: $searchCityCode,
          searchDistrictCode: $searchDistrictCode,
          isSearch: $isSearch
        })
      }
      if (this.currentSearchType === '租金') {
        RentPriceRender({
          currentSearchType: $currentSearchType,
          isRentPriceSearch: $isRentPriceSearch,
          searchRentPrice: $searchRentPrice
        })
      }
      if (this.currentSearchType === '付款方式') {
        PaymentTypeRender(
          {
            currentSearchType: $currentSearchType,
            isPaymentTypeSearch: $isPaymentTypeSearch,
            searchPaymentType: $searchPaymentType
          }
        )
      }
      if (this.currentSearchType === '排序') {
        SortRender(
          {
            currentSearchType: $currentSearchType,
            searchSort: $searchSort
          }
        )
      }
    }
  }
}

@Extend(Image)
function imageStyles() {
  .width(12).height(12).objectFit(ImageFit.Fill)
}
