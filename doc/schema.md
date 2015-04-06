# Feedback DB proposal
See  [db/seeds.rb](https://github.com/pcgi/feedback/blob/master/db/seeds.rb) for data values for queries.

## Queries
Feedback from one `terminal`:

    SELECT count(*), answers.value FROM responses
    INNER JOIN answers ON responses.answer_id = answers.id
    WHERE responses.terminal_id = (SELECT id FROM terminals LIMIT 1)
    GROUP BY answers.value;

    count | value
    -------+-------
         1 |   100
         1 |    50
         1 |     0

Feedback for an `account`:

    SELECT count(*), answers.value FROM responses
    INNER JOIN answers ON responses.answer_id = answers.id
    INNER JOIN questions ON answers.question_id = questions.id
    WHERE questions.account_id = (SELECT id FROM accounts LIMIT 1)
    GROUP BY answers.value;

     count | value
    -------+-------
         1 |   100
         1 |    50
         1 |     0

## Database structure
    create_table "accounts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "answers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid     "question_id"
      t.integer  "value"
      t.string   "label"
      t.string   "confirmation"
      t.boolean  "comment"
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end

    create_table "locations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid     "account_id"
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "questions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid     "account_id"
      t.string   "body"
      t.integer  "number_of_answers"
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
    end

    create_table "responses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid     "terminal_id"
      t.integer  "answer"
      t.text     "comment"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "terminals", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid     "location_id"
      t.uuid     "question_id"
      t.string   "name"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "users", force: :cascade do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet     "current_sign_in_ip"
      t.inet     "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

