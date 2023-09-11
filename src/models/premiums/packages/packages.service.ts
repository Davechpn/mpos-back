import { Injectable } from '@nestjs/common';
import { CreatePackageDto } from './dto/create-package.dto';
import { UpdatePackageDto } from './dto/update-package.dto';
import { PrismaService } from 'src/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class PackagesService {
  constructor(private prisma: PrismaService) { }

  create(createPackageDto: CreatePackageDto) {
    return this.prisma.package.create({
      data: {
        name: createPackageDto.name,
        description: createPackageDto.description,
        color: createPackageDto.color,
        level: createPackageDto.level,
        prices: {
          create: createPackageDto.prices
        }
      }
    })
  }

  findAll() {
    return this.prisma.package.findMany({
      include: {
        prices: true
      }
    })
  }

  findOne(id: number) {
    return `This action returns a #${id} package`;
  }

  update(id: number, updatePackageDto: UpdatePackageDto) {
    return `This action updates a #${id} package`;
  }

  remove(id: number) {
    return `This action removes a #${id} package`;
  }
}
