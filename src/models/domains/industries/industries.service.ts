import { Injectable } from '@nestjs/common';
import { CreateIndustryDto } from './dto/create-industry.dto';
import { UpdateIndustryDto } from './dto/update-industry.dto';
import { PrismaService } from 'src/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class IndustriesService {
  constructor(private prisma: PrismaService) { }

  create(createIndustryDto: CreateIndustryDto) {
    return this.prisma.industry.create({ data: createIndustryDto as Prisma.IndustryCreateInput })
  }

  findAll() {
    return this.prisma.industry.findMany()
  }
  findOne(id: number) {
    return `This action returns a #${id} industry`;
  }

  update(id: number, updateIndustryDto: UpdateIndustryDto) {
    return `This action updates a #${id} industry`;
  }

  remove(id: number) {
    return `This action removes a #${id} industry`;
  }
}
