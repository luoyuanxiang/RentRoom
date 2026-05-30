import { IPlanItem } from "../../model/HomeData";

@Component
export default struct PlanList {
  @Prop planList: IPlanItem[]

  build() {
    Row({ space: 10 }) {
      ForEach(this.planList, (item: IPlanItem) => {
        Image(item.imageURL)
          .width(78)
          .height(60)
      })
    }.width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ top: 10 })
  }
}