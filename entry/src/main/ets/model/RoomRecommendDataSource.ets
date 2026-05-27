import { GenericBasicDataSource } from "./GenericBasicDataSource";

export interface IRoomRecommendItem {
  address: string;
  housePicture: string;
  houseTitle: string;
  id: string;
  rentArea: string;
  rentPriceListing: string;
  rentPriceUnit: string;
  tags: ITagItem[];
}

export interface ITagItem {
  name: string;
}

/**
 * 房源推荐数据源
 * 使用懒加载模式
 */
export class RoomRecommendDataSource extends GenericBasicDataSource<IRoomRecommendItem> {
}