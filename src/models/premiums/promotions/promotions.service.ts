import { Injectable } from '@nestjs/common';
import { CreatePromotionDto } from './dto/create-promotion.dto';
import { UpdatePromotionDto } from './dto/update-promotion.dto';
import { PrismaService } from 'src/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class PromotionsService {

  constructor(private prisma: PrismaService) { }

  create(createPromotionDto: CreatePromotionDto) {
    return this.prisma.promotion.create({
      data: {
        name: createPromotionDto.name,
        description: createPromotionDto.description,
        startDate: new Date(createPromotionDto.startDate),
        endDate: new Date(createPromotionDto.endDate)
      }
    })
  }

  findAll() {
    return this.prisma.promotion.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} promotion`;
  }

  update(id: number, updatePromotionDto: UpdatePromotionDto) {
    return `This action updates a #${id} promotion`;
  }

  remove(id: number) {
    return `This action removes a #${id} promotion`;
  }
}
