-- ================================================================
-- 0001_meta.sql – core metadata tables
-- ================================================================

CREATE TABLE IF NOT EXISTS last_sync (
    type TEXT PRIMARY KEY,
    last_updated TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    approved BOOLEAN NOT NULL DEFAULT FALSE,
    role TEXT NOT NULL    -- e.g. 'admin' or 'user'
);
