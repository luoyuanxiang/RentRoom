import type { IRoomRecommendItem } from '../model/RoomRecommendDataSource'
import { GenericBasicDataSource } from './GenericBasicDataSource'

export type IPaymentType = "月付" | "季付" | "半年付" | "年付"

export type IOrderBy = "面积" | "价格"

export type IOrderType = "asc" | "desc"

export interface IGetRentRoomListParams {
  page: number;
  limit: number;
  cityCode?: string;
  districtCode?: string;
  provinceCode?: string;
  maxRent?: number;
  minRent?: number;
  orderBy?: IOrderType;
  paymentType?: string;
}

export interface IGetRentRoomListResponse {
  records: IRentRoomList
  total: number
}

export interface IActivity {
  title: string
  textColor: string
  textBackGroundColor: string
  "#text": string
  icon: string
  textContent: string
}

export interface IRentRoomItem extends IRoomRecommendItem {
  activity?: IActivity
}

export type IRentRoomList = IRentRoomItem[]


export class RentRoomListDataSource extends GenericBasicDataSource<IRentRoomItem> {
}

export interface IProvinceItem {
  code: string;
  name: string;
}

export type IProvinceList = IProvinceItem[]

export interface ICityItem extends IProvinceItem {
  provinceCode?: string;
}

export type ICityList = ICityItem[]

export interface IDistrictItem extends ICityItem {
  cityCode: string;
}

export type IDistrictList = IDistrictItem[]

export interface GetCityListParams {
  provinceCode: string
}

export interface GetDistrictListParams {
  cityCode: string
}

export interface IRentPriceItem {
  id: number;
  minRent: string;
  maxRent: string;
  text: string;
}

export type IRentPriceList = IRentPriceItem[]


export interface ISortItem {
  id: number;
  icon: Resource;
  text: string;
  orderBy?: IOrderBy;
  orderType?: IOrderType;
}