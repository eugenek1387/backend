
-- +migrate Up

CREATE TABLE talks (
    id BIGSERIAL PRIMARY KEY,
    lead_id bigint REFERENCES leads (id) ON DELETE CASCADE,
    message TEXT DEFAULT '',
    message_type VARCHAR(255) DEFAULT '',
    date timestamp default NOW(),
    tg_username VARCHAR(255) DEFAULT ''
);

-- +migrate Down

DROP TABLE talks;