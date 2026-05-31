import { IHouseholdItem, IItemList } from "../../model/RentRoomData";

@Component
export default struct HouseholdItem {
  @Link householdList: IHouseholdItem[]

  build() {
    Column({ space: 16 }) {
      Text('物品配置').fontSize(16).fontWeight(700)
      ForEach(this.householdList, (household: IHouseholdItem) => {
        Column({ space: 16 }) {
          Row({ space: 10 }) {
            Text(household.name).fontSize(14).fontWeight(700)
            Text(`${household.itemList.length}件物品`).grayText(10)
          }
          Grid() {
            ForEach(household.itemList, (item: IItemList) => {
              GridItem() {
                Row({ space: 4 }) {
                  Image(item.icon).width(16)
                  Text(item.value).grayText(14)
                }.justifyContent(FlexAlign.Start).width('100%')
              }
            }, (item: IItemList) => item.value)
          }
          .columnsTemplate('1fr 1fr 1fr')
          .rowsGap(16)
          .width('100%')
          .height(16 * 3)
        }.alignItems(HorizontalAlign.Start)
      }, (household: IHouseholdItem) => household.name)
    }.alignItems(HorizontalAlign.Start).margin({ top: 20 })
  }
}

@Extend(Text) function grayText(size: number) {
  .fontColor('#999999').fontSize(size)
}