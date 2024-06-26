import { Prisma, PrismaClient } from '@prisma/client'
import { readFile } from 'fs'
import { ScryfallCard } from './models/scryfall_card'

export function runCardImport() {
  readFile('./oracle-cards.json', {}, insertCards)
}

async function insertCards(err: Error | null, data: Buffer) {
  if (err != null) {
    console.error('Error reading cards from file')
    console.error(err)
  }

  let cardsToCreate: Prisma.CardCreateManyInput[] = []
  let batchSize = 100
  let i = 0
  var client = new PrismaClient()
  var cardsImport = JSON.parse(data.toString())

  let value: ScryfallCard
  for (let [_, rawValue] of Object.entries(cardsImport)) {
    if (rawValue === undefined) continue
    value = rawValue as ScryfallCard
    cardsToCreate.push({
      scryfallId: value.id,
      oracleId: value.oracle_id,
      multiverseIds: value.multiverse_ids,
      mtgOnlineId: value.mtgo_id,
      tcgplayerId: value.tcgplayer_id,
      cardmarketId: value.cardmarket_id,
      name: value.name,
      lang: value.lang,
      releasedAt: value.released_at,
      scryfallApiUri: value.uri,
      scryfallUri: value.scryfall_uri,
      layout: value.layout,
      highresImageAvailable: value.highres_image,
      imageStatus: value.image_status,
      manaCost: value.mana_cost,
      convertedManaCost: value.cmc,
      typeLine: value.type_line,
      oracleText: value.oracle_text,
      colors: value.colors,
      color_identity: value.color_identity,
      keywords: value.keywords,
      reserved: value.reserved,
      oversized: value.oversized,
      promo: value.promo,
      reprint: value.reprint,
      variation: value.variation,
      setId: value.set_id,
      set: value.set,
      setName: value.set_name,
      setType: value.set_type,
      setUri: value.set_uri,
      setSearchUri: value.set_search_uri,
      scryfallSetUri: value.scryfall_set_uri,
      rulingsUri: value.rulings_uri,
      printsSearchUri: value.prints_search_uri,
      collectorNumber: value.collector_number,
      digital: value.digital,
      rarity: value.rarity,
      flavorText: value.flavor_text,
      cardBackId: value.card_back_id,
      artist: value.artist,
      artistIds: value.artist_ids,
      illustrationId: value.illustration_id,
      borderColor: value.border_color,
      frame: value.frame,
      fullArt: value.full_art,
      textless: value.textless,
      booster: value.booster,
      storySpotlight: value.story_spotlight,
      edhrecRank: value.edhrec_rank,
      power: value.power,
      toughness: value.toughness,
    })
    i++
    if (i >= batchSize) {
      i = 0
      await client.card.createMany({ data: cardsToCreate, skipDuplicates: false })
      cardsToCreate = []
    }
  }
}
