export class CreatePackageDto {
    name:string
    description:string
    prices:PackagePrice[]
    features:string[]
    color:string
    level:number
}
export interface PackagePrice {
    duration:number,
    amount:number,
    extention_time:number
}