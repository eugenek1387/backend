
-- +migrate Up
CREATE INDEX user_st_lead ON leads.leads (user_id, state);

-- +migrate Down
DROP INDEX user_st_lead;