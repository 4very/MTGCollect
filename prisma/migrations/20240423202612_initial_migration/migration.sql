-- CreateTable
CREATE TABLE "Deck" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Deck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeckCard" (
    "id" SERIAL NOT NULL,
    "deckId" INTEGER NOT NULL,
    "cardId" INTEGER NOT NULL,

    CONSTRAINT "DeckCard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Card" (
    "cardId" SERIAL NOT NULL,
    "scryfallId" INTEGER NOT NULL,
    "oracleId" INTEGER NOT NULL,
    "multiverseIds" INTEGER[],
    "mtgOnlineId" INTEGER NOT NULL,
    "tcgplayerId" INTEGER NOT NULL,
    "cardmarketId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "releasedAt" TIMESTAMP(3) NOT NULL,
    "scryfallApiUri" TEXT NOT NULL,
    "scryfallUri" TEXT NOT NULL,
    "layout" TEXT NOT NULL,
    "highresImageAvailable" BOOLEAN NOT NULL,
    "imageStatus" TEXT NOT NULL,
    "image_uris" TEXT[],
    "manaCost" TEXT NOT NULL,
    "convertedManaCost" INTEGER NOT NULL,
    "typeLine" TEXT NOT NULL,
    "oracleText" TEXT NOT NULL,
    "colors" TEXT[],
    "color_identity" TEXT[],
    "keywords" TEXT[],
    "power" INTEGER NOT NULL,
    "toughness" INTEGER NOT NULL,
    "reserved" BOOLEAN NOT NULL,
    "oversized" BOOLEAN NOT NULL,
    "promo" BOOLEAN NOT NULL,
    "reprint" BOOLEAN NOT NULL,
    "variation" BOOLEAN NOT NULL,
    "setId" TEXT NOT NULL,
    "set" TEXT NOT NULL,
    "setName" TEXT NOT NULL,
    "setType" TEXT NOT NULL,
    "setUri" TEXT NOT NULL,
    "setSearchUri" TEXT NOT NULL,
    "scryfallSetUri" TEXT NOT NULL,
    "rulingsUri" TEXT NOT NULL,
    "printsSearchUri" TEXT NOT NULL,
    "collectorNumber" TEXT NOT NULL,
    "digital" BOOLEAN NOT NULL,
    "rarity" TEXT NOT NULL,
    "flavorText" TEXT NOT NULL,
    "cardBackId" TEXT NOT NULL,
    "artist" TEXT NOT NULL,
    "artistIds" TEXT[],
    "illustrationId" TEXT NOT NULL,
    "borderColor" TEXT NOT NULL,
    "frame" TEXT NOT NULL,
    "fullArt" BOOLEAN NOT NULL,
    "textless" BOOLEAN NOT NULL,
    "booster" BOOLEAN NOT NULL,
    "storySpotlight" BOOLEAN NOT NULL,
    "edhrecRank" INTEGER NOT NULL,

    CONSTRAINT "Card_pkey" PRIMARY KEY ("cardId")
);

-- CreateTable
CREATE TABLE "Legalities" (
    "id" SERIAL NOT NULL,
    "standard" TEXT NOT NULL,
    "future" TEXT NOT NULL,
    "historic" TEXT NOT NULL,
    "timeless" TEXT NOT NULL,
    "gladiator" TEXT NOT NULL,
    "pioneer" TEXT NOT NULL,
    "explorer" TEXT NOT NULL,
    "modern" TEXT NOT NULL,
    "legacy" TEXT NOT NULL,
    "pauper" TEXT NOT NULL,
    "vintage" TEXT NOT NULL,
    "penny" TEXT NOT NULL,
    "commander" TEXT NOT NULL,
    "oathbreaker" TEXT NOT NULL,
    "standardbrawl" TEXT NOT NULL,
    "brawl" TEXT NOT NULL,
    "alchemy" TEXT NOT NULL,
    "paupercommander" TEXT NOT NULL,
    "duel" TEXT NOT NULL,
    "oldschool" TEXT NOT NULL,
    "premodern" TEXT NOT NULL,
    "predh" TEXT NOT NULL,

    CONSTRAINT "Legalities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardPrices" (
    "id" SERIAL NOT NULL,
    "usd" TEXT NOT NULL,
    "usd_foil" TEXT NOT NULL,
    "usd_etched" TEXT NOT NULL,
    "eur" TEXT NOT NULL,
    "eur_foil" TEXT NOT NULL,
    "tix" TEXT NOT NULL,

    CONSTRAINT "CardPrices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RelatedUris" (
    "id" SERIAL NOT NULL,
    "gatherer" TEXT NOT NULL,
    "tcgplayer_infinite_articles" TEXT NOT NULL,
    "tcgplayer_infinite_decks" TEXT NOT NULL,
    "edhrec" TEXT NOT NULL,

    CONSTRAINT "RelatedUris_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PurchaseUris" (
    "id" SERIAL NOT NULL,
    "tcgplayer" TEXT NOT NULL,
    "cardmarket" TEXT NOT NULL,
    "cardhoarder" TEXT NOT NULL,

    CONSTRAINT "PurchaseUris_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CardToLegalities" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CardToCardPrices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CardToRelatedUris" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CardToPurchaseUris" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CardToLegalities_AB_unique" ON "_CardToLegalities"("A", "B");

-- CreateIndex
CREATE INDEX "_CardToLegalities_B_index" ON "_CardToLegalities"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CardToCardPrices_AB_unique" ON "_CardToCardPrices"("A", "B");

-- CreateIndex
CREATE INDEX "_CardToCardPrices_B_index" ON "_CardToCardPrices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CardToRelatedUris_AB_unique" ON "_CardToRelatedUris"("A", "B");

-- CreateIndex
CREATE INDEX "_CardToRelatedUris_B_index" ON "_CardToRelatedUris"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CardToPurchaseUris_AB_unique" ON "_CardToPurchaseUris"("A", "B");

-- CreateIndex
CREATE INDEX "_CardToPurchaseUris_B_index" ON "_CardToPurchaseUris"("B");

-- AddForeignKey
ALTER TABLE "DeckCard" ADD CONSTRAINT "DeckCard_deckId_fkey" FOREIGN KEY ("deckId") REFERENCES "Deck"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeckCard" ADD CONSTRAINT "DeckCard_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("cardId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToLegalities" ADD CONSTRAINT "_CardToLegalities_A_fkey" FOREIGN KEY ("A") REFERENCES "Card"("cardId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToLegalities" ADD CONSTRAINT "_CardToLegalities_B_fkey" FOREIGN KEY ("B") REFERENCES "Legalities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToCardPrices" ADD CONSTRAINT "_CardToCardPrices_A_fkey" FOREIGN KEY ("A") REFERENCES "Card"("cardId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToCardPrices" ADD CONSTRAINT "_CardToCardPrices_B_fkey" FOREIGN KEY ("B") REFERENCES "CardPrices"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToRelatedUris" ADD CONSTRAINT "_CardToRelatedUris_A_fkey" FOREIGN KEY ("A") REFERENCES "Card"("cardId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToRelatedUris" ADD CONSTRAINT "_CardToRelatedUris_B_fkey" FOREIGN KEY ("B") REFERENCES "RelatedUris"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToPurchaseUris" ADD CONSTRAINT "_CardToPurchaseUris_A_fkey" FOREIGN KEY ("A") REFERENCES "Card"("cardId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardToPurchaseUris" ADD CONSTRAINT "_CardToPurchaseUris_B_fkey" FOREIGN KEY ("B") REFERENCES "PurchaseUris"("id") ON DELETE CASCADE ON UPDATE CASCADE;
