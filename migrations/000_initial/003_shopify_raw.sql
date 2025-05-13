-- ================================================================
-- 0003_shopify_raw.sql – raw Shopify objects
-- ================================================================

CREATE TABLE IF NOT EXISTS raw_shopify_orders (
    order_id TEXT PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    display_financial_status TEXT,
    original_total_price NUMERIC,
    current_discounts NUMERIC,
    current_subtotal NUMERIC,
    current_total_price NUMERIC,
    channel_name TEXT,
    sub_channel_name TEXT,
    total_tax NUMERIC,
    shipping_charges NUMERIC,
    shipping_charge_taxes NUMERIC,
    carrier_identifier TEXT,
    shipping_address1 TEXT,
    shipping_city TEXT,
    shipping_zip TEXT,
    shipping_country_code TEXT,
    discount_codes TEXT,
    discount_total_amount NUMERIC,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_shopify_order_lines (
    line_item_id TEXT PRIMARY KEY,
    order_id TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title TEXT,
    quantity NUMERIC,
    sku TEXT,
    product_id TEXT,
    product_type TEXT,
    variant_id TEXT,
    variant_sku TEXT,
    variant_price NUMERIC,
    original_total NUMERIC,
    discounted_total NUMERIC,
    discount_codes TEXT,
    discount_amounts TEXT,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_shopify_refunds (
    refund_id TEXT PRIMARY KEY,
    order_id TEXT,
    created_at TIMESTAMP,
    processed_at TIMESTAMP,
    updated_at TIMESTAMP,
    total_refunded NUMERIC,
    refund_amount NUMERIC,
    sale_id TEXT,
    product_title TEXT,
    gross_returns NUMERIC,
    discounts_returned NUMERIC,
    shipping_returned NUMERIC,
    taxes_returned NUMERIC,
    return_fees NUMERIC,
    net_returns NUMERIC,
    total_returns NUMERIC,
    ingested_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS raw_shopify_refund_lines (
    refund_line_item_id TEXT PRIMARY KEY,
    refund_id TEXT,
    order_id TEXT,
    quantity NUMERIC,
    subtotal NUMERIC,
    tax_subtotal NUMERIC,
    line_item_id TEXT,
    title TEXT,
    sku TEXT,
    product_id TEXT,
    product_type TEXT,
    variant_id TEXT,
    variant_sku TEXT,
    ingested_at TIMESTAMP DEFAULT NOW()
);
