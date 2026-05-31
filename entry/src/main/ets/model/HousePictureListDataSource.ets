import { GenericBasicDataSource } from "./GenericBasicDataSource";

export interface HousePictureListData {
    url: string;
    curentIndex: number;
}
export class HousePictureListDataSource extends GenericBasicDataSource<HousePictureListData> {

}