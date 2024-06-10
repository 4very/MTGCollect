import { runCardImport } from "./cardInserter"

export default defineEventHandler((event) => {
    runCardImport();
    return { "status": "ok" }
})
