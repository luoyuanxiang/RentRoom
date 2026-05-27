import { GenericBasicDataSource } from "./GenericBasicDataSource";
import { IBannerItem } from "./HomeData";

/**
 * 轮播数据源
 * 使用懒加载模式
 */
export class BannerDataSource extends GenericBasicDataSource<IBannerItem> {
}