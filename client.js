const { Client } = require("pg");

const client = new Client({
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
});

async function connectAndQuery() {
  try {
    await client.connect();
    console.log("Connected to Postgres");

    const res = await client.query("SELECT NOW()");
    console.log('Current time on the Postgres server:', res.rows[0]);
  } catch (err) {
    console.error('Error connecting to Postgres:', err.stack);
  } finally {
    await client.end();
    console.log('Disconnected from Postgres');
  }
}

connectAndQuery();
