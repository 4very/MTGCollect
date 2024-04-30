# MTGCollect
## How to start locally with a DB
1. Copy the `.env.example` file to `.env`
2. Start the DB with docker `docker compose up`
3. In a different terminal window, run the `npm run prismadev` command. This will apply the migrations currently in `prisma/migrations` to your local DB. 
4. Start the server with `npm run dev` 