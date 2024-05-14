import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

prisma.card.findMany({
    include: {
        DeckCard: false
    }
})