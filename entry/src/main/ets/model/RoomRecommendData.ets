export interface IRoomRecommendData {
  address: string;
  housePicture: string;
  houseTitle: string;
  id: string;
  rentArea: string;
  rentPriceListing: string;
  rentPriceUnit: string;
  tags: ITag[];
}

export interface ITag {
  name: string;
}