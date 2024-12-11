
-- +migrate Up

CREATE TABLE chatbot_bindings (
    id BIGSERIAL PRIMARY KEY,
    quiz_hash varchar(100),
    chat_id BIGINT,
    is_bound BOOLEAN DEFAULT true,
    bot_name varchar(100) NOT NULL, 
    date timestamp default NOW()
);

CREATE UNIQUE INDEX chatbot_binding_quiz_hash_chat_id_idx ON chatbot_bindings(quiz_hash, chat_id, bot_name);

-- +migrate Down

DROP TABLE chatbot_bindings;