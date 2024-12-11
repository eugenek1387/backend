
-- +migrate Up

CREATE TABLE leads (
    id BIGSERIAL PRIMARY KEY,
    quiz_hash VARCHAR(50),
    revision_id BIGINT,
    json_data JSONB DEFAULT '{}',
    contacts JSONB DEFAULT '{}', --name, phone, email, viber, ...
    state VARCHAR(50), --new, seen, unfinished, done, archived
    response_date TIMESTAMP DEFAULT now(),
    last_step INT,
    is_completed BOOLEAN DEFAULT FALSE,
    user_id BIGINT,
    INDEX quiz_hash_index (quiz_hash ASC)
);
-- +migrate Down

DROP TABLE leads;
