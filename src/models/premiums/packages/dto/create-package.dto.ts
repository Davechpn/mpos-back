export class CreatePackageDto {
    name: string
    description: string
    prices: PackagePrice[]
    color: string
    level: number
}

export class PackagePrice {
    duration: number
    amount: number
    extentionTime: number
}
