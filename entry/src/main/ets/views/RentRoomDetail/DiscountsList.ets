import { IDiscount } from "../../model/RentRoomData";

@Component
export default struct DiscountsList {
  @Link discountsList: IDiscount[]
  build() {
    Column({ space: 16 }) {
      ForEach(this.discountsList, (item: IDiscount) => {
        Row({ space: 8 }) {
          Image(item.image).height(20)
          Text(item.txt).fontSize(12).fontColor('#999999')
          Blank()
          Image($r('app.media.arrow_right')).width(4).fillColor('#01AB39')
        }.width('100%')
      }, (item: IDiscount) => item.txt)
    }.padding({ top: 13 })
  }
}