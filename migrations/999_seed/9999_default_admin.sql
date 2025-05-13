-- ================================================================
-- 9999_default_admin.sql – seed default admin user
-- ================================================================
-- Expect these vars as Docker ENV  →  set at run-time via "envsubst" or
-- write literal values if you prefer.

\set admin_user      :'DEFAULT_ADMIN_USER'
\set admin_hash      :'DEFAULT_ADMIN_HASH'

INSERT INTO users (username, password_hash, approved, role)
SELECT :'admin_user', :'admin_hash', TRUE, 'admin'
WHERE  NOT EXISTS (SELECT 1 FROM users WHERE username = :'admin_user');
