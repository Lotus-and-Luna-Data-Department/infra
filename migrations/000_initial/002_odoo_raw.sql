-- ================================================================
-- 0002_odoo_raw.sql – raw Odoo objects
-- ================================================================

CREATE TABLE IF NOT EXISTS odoo_order_tags (
    order_id TEXT REFERENCES raw_odoo_orders(order_id),
    tag TEXT NOT NULL,
    PRIMARY KEY (order_id, tag)
);

CREATE TABLE IF NOT EXISTS raw_odoo_account_moves (
    move_id TEXT PRIMARY KEY,
    sale_order_refs TEXT,
    invoice_number_ref TEXT,
    move_type TEXT,
    state TEXT,
    amount_residual NUMERIC,
    amount_total NUMERIC,
    invoice_date_due TIMESTAMP,
    create_date TIMESTAMP,
    last_updated TIMESTAMP,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_account_payments (
    payment_id TEXT PRIMARY KEY,
    payment_move_id TEXT NOT NULL,
    invoice_move_id TEXT NOT NULL,
    invoice_number_ref TEXT,
    amount NUMERIC,
    create_date TIMESTAMP,
    last_updated TIMESTAMP,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_listing_items (
    item_id TEXT PRIMARY KEY,
    continue_selling BOOLEAN,
    default_code TEXT,
    is_listed BOOLEAN,
    listing TEXT,
    marketplace_id TEXT,
    sale_price NUMERIC,
    created_on TIMESTAMP,
    last_updated TIMESTAMP,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_listings (
    listing_id TEXT PRIMARY KEY,
    name TEXT,
    display_name TEXT,
    product_template TEXT,
    marketplace_id TEXT,
    marketplace_instance TEXT,
    is_listed BOOLEAN,
    is_published BOOLEAN,
    allow_sales_when_out_of_stock BOOLEAN,
    created_on TIMESTAMP,
    last_updated TIMESTAMP,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_order_lines (
    line_item_id TEXT PRIMARY KEY,
    order_id TEXT,
    sales_date TIMESTAMP,
    last_updated TIMESTAMP,
    sku TEXT,
    quantity NUMERIC,
    unit_price NUMERIC,
    product_category TEXT,
    to_invoice TEXT,
    cost NUMERIC,
    sales_team TEXT,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_orders (
    order_id TEXT PRIMARY KEY,
    create_date TIMESTAMP,
    last_updated TIMESTAMP,
    sales_date TIMESTAMP,
    date_order TIMESTAMP,
    delivery_date TIMESTAMP,
    delivery_address TEXT,
    sales_team TEXT,
    sales_person TEXT,
    amount_total NUMERIC,
    payment_terms TEXT,
    state TEXT,
    invoice_status TEXT,
    customer TEXT,
    shipping_policy TEXT,
    channel TEXT,
    delivery_status TEXT,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_products (
    product_id TEXT PRIMARY KEY,
    internal_reference TEXT,
    name TEXT,
    qty_on_hand NUMERIC,
    free_qty NUMERIC,
    outgoing_qty NUMERIC,
    incoming_qty NUMERIC,
    last_updated TIMESTAMP,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_odoo_stock_pickings (
    stock_picking_id TEXT PRIMARY KEY,
    sale_order_reference TEXT,
    date_done TIMESTAMP,
    scheduled_date TIMESTAMP,
    create_date TIMESTAMP,
    last_updated TIMESTAMP,
    state TEXT,
    picking_type TEXT,
    ingested_at TIMESTAMP DEFAULT NOW()
);
