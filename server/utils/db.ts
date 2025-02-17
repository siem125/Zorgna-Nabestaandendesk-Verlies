import pkg from 'pg';
const { Pool } = pkg;

//using pool because Client itself gave errors about already a connection open while i kept the connect and end on each api
const pool = new Pool({
    host: process.env.DATABASE_HOST,
    port: Number(process.env.DATABASE_PORT),
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME,
    max: 10, // Adjust based on workload
    idleTimeoutMillis: 30000, // Close idle connections after 30 seconds
    connectionTimeoutMillis: 2000, // Timeout if a connection can't be acquired
});

//await client.connect();
//await client.end();

export default pool;