import { http } from '../utils/Index'
import type { IHomeData } from '../model/HomeData'
import { IRoomRecommendItem } from '../model/RoomRecommendDataSource'

// 获取首页数据
export const getHomeDataApi = (): Promise<IHomeData> => {
  return http.get<IHomeData>('/home/info')
}

// 获取首页周边房源数据
export const getRoomRecommendListApi = (): Promise<IRoomRecommendItem[]> => {
  return http.get<IRoomRecommendItem[]>('/house/nearbyHouses')
}