-- CreateTable
CREATE TABLE "Feature" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "industries" TEXT[],
    "countries" TEXT[],

    CONSTRAINT "Feature_pkey" PRIMARY KEY ("id")
);
