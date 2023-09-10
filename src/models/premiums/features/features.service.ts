import { Injectable } from '@nestjs/common';
import { CreateFeatureDto } from './dto/create-feature.dto';
import { UpdateFeatureDto } from './dto/update-feature.dto';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class FeaturesService {

  constructor(private prisma:PrismaService) {}

  create(createFeatureDto: Prisma.FeatureCreateInput) {
    return this.prisma.feature.create({data:createFeatureDto})
  }

  findAll() {
    return this.prisma.feature.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} feature`;
  }

  update(id: number, updateFeatureDto: UpdateFeatureDto) {
    return `This action updates a #${id} feature`;
  }

  remove(id: number) {
    return `This action removes a #${id} feature`;
  }
}
