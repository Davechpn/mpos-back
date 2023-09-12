import { Injectable } from '@nestjs/common';
import { CreateDomainDto } from './dto/create-domain.dto';
import { UpdateDomainDto } from './dto/update-domain.dto';
import { PrismaService } from 'src/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class DomainsService {


  constructor(private prisma: PrismaService) { }

  create(createDomainDto: CreateDomainDto) {
    return this.prisma.domain.create({ data: createDomainDto as Prisma.DomainCreateInput })
  }

  findAll() {
    return this.prisma.domain.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} domain`;
  }

  update(id: number, updateDomainDto: UpdateDomainDto) {
    return `This action updates a #${id} domain`;
  }

  remove(id: number) {
    return `This action removes a #${id} domain`;
  }
}
