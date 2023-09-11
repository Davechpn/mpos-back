import { Injectable } from '@nestjs/common';
import { CreateCountryDto } from './dto/create-country.dto';
import { UpdateCountryDto } from './dto/update-country.dto';
import { PrismaService } from 'src/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class CountriesService {

  constructor(private prisma: PrismaService) { }

  create(createCountryDto: CreateCountryDto) {
    return this.prisma.country.create({ data: createCountryDto })
  }

  findAll() {
    return this.prisma.country.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} country`;
  }

  update(id: number, updateCountryDto: UpdateCountryDto) {
    return `This action updates a #${id} country`;
  }

  remove(id: number) {
    return `This action removes a #${id} country`;
  }
}
