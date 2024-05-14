import { insertCards } from "./cardInserter"

export default defineEventHandler((event) => {
    insertCards();
    return { "status": "ok" }
})
