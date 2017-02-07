# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_170_204_193_519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'average_caches', force: :cascade do |t|
    t.integer  'rater_id'
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'avg', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'categories', force: :cascade do |t|
    t.string  'name'
    t.integer 'parent_id'
    t.integer 'lft',                        null: false
    t.integer 'rgt',                        null: false
    t.integer 'depth',          default: 0, null: false
    t.integer 'children_count', default: 0, null: false
    t.index ['lft'], name: 'index_categories_on_lft', using: :btree
    t.index ['parent_id'], name: 'index_categories_on_parent_id', using: :btree
    t.index ['rgt'], name: 'index_categories_on_rgt', using: :btree
  end

  create_table 'classifieds', force: :cascade do |t|
    t.string   'make'
    t.string   'model'
    t.string   'year'
    t.string   'color'
    t.string   'title'
    t.string   'condition'
    t.string   'offer'
    t.string   'make_country'
    t.text     'description'
    t.integer  'user_id'
    t.datetime 'created_at',                   null: false
    t.datetime 'updated_at',                   null: false
    t.integer  'category_id'
    t.boolean  'sold',         default: false
    t.boolean  'hold',         default: false
    t.integer  'price_cents'
    t.boolean  'giveaway',     default: false
    t.boolean  'trade',        default: false
    t.boolean  'sell',         default: true
    t.boolean  'askingfor',    default: false
    t.index ['category_id'], name: 'index_classifieds_on_category_id', using: :btree
    t.index ['user_id'], name: 'index_classifieds_on_user_id', using: :btree
  end

  create_table 'favorite_classifieds', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'classified_id'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.index ['classified_id'], name: 'index_favorite_classifieds_on_classified_id', using: :btree
    t.index ['user_id'], name: 'index_favorite_classifieds_on_user_id', using: :btree
  end

  create_table 'flags', force: :cascade do |t|
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.integer  'user_id'
    t.integer  'classified_id'
    t.index ['classified_id'], name: 'index_flags_on_classified_id', using: :btree
    t.index ['user_id'], name: 'index_flags_on_user_id', using: :btree
  end

  create_table 'mailboxer_conversation_opt_outs', force: :cascade do |t|
    t.string  'unsubscriber_type'
    t.integer 'unsubscriber_id'
    t.integer 'conversation_id'
    t.index ['conversation_id'], name: 'index_mailboxer_conversation_opt_outs_on_conversation_id', using: :btree
    t.index %w(unsubscriber_id unsubscriber_type), name: 'index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type', using: :btree
  end

  create_table 'mailboxer_conversations', force: :cascade do |t|
    t.string   'subject', default: ''
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  create_table 'mailboxer_notifications', force: :cascade do |t|
    t.string   'type'
    t.text     'body'
    t.string   'subject', default: ''
    t.string   'sender_type'
    t.integer  'sender_id'
    t.integer  'conversation_id'
    t.boolean  'draft', default: false
    t.string   'notification_code'
    t.string   'notified_object_type'
    t.integer  'notified_object_id'
    t.string   'attachment'
    t.datetime 'updated_at',                           null: false
    t.datetime 'created_at',                           null: false
    t.boolean  'global', default: false
    t.datetime 'expires'
    t.index ['conversation_id'], name: 'index_mailboxer_notifications_on_conversation_id', using: :btree
    t.index %w(notified_object_id notified_object_type), name: 'index_mailboxer_notifications_on_notified_object_id_and_type', using: :btree
    t.index %w(sender_id sender_type), name: 'index_mailboxer_notifications_on_sender_id_and_sender_type', using: :btree
    t.index ['type'], name: 'index_mailboxer_notifications_on_type', using: :btree
  end

  create_table 'mailboxer_receipts', force: :cascade do |t|
    t.string   'receiver_type'
    t.integer  'receiver_id'
    t.integer  'notification_id', null: false
    t.boolean  'is_read',                    default: false
    t.boolean  'trashed',                    default: false
    t.boolean  'deleted',                    default: false
    t.string   'mailbox_type', limit: 25
    t.datetime 'created_at',                                 null: false
    t.datetime 'updated_at',                                 null: false
    t.boolean  'is_delivered', default: false
    t.string   'delivery_method'
    t.string   'message_id'
    t.index ['notification_id'], name: 'index_mailboxer_receipts_on_notification_id', using: :btree
    t.index %w(receiver_id receiver_type), name: 'index_mailboxer_receipts_on_receiver_id_and_receiver_type', using: :btree
  end

  create_table 'makes', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'overall_averages', force: :cascade do |t|
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'overall_avg', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'photos', force: :cascade do |t|
    t.integer  'classified_id'
    t.datetime 'created_at',         null: false
    t.datetime 'updated_at',         null: false
    t.string   'image_file_name'
    t.string   'image_content_type'
    t.integer  'image_file_size'
    t.datetime 'image_updated_at'
    t.integer  'service_id'
    t.index ['classified_id'], name: 'index_photos_on_classified_id', using: :btree
    t.index ['service_id'], name: 'index_photos_on_service_id', using: :btree
  end

  create_table 'posts', force: :cascade do |t|
    t.string   'title'
    t.text     'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'rates', force: :cascade do |t|
    t.integer  'rater_id'
    t.string   'rateable_type'
    t.integer  'rateable_id'
    t.float    'stars', null: false
    t.string   'dimension'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w(rateable_id rateable_type), name: 'index_rates_on_rateable_id_and_rateable_type', using: :btree
    t.index ['rater_id'], name: 'index_rates_on_rater_id', using: :btree
  end

  create_table 'rating_caches', force: :cascade do |t|
    t.string   'cacheable_type'
    t.integer  'cacheable_id'
    t.float    'avg',            null: false
    t.integer  'qty',            null: false
    t.string   'dimension'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w(cacheable_id cacheable_type), name: 'index_rating_caches_on_cacheable_id_and_cacheable_type', using: :btree
  end

  create_table 'services', force: :cascade do |t|
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.string   'categ'
    t.string   'specialty'
    t.string   'regions'
    t.integer  'price_cents'
    t.string   'title'
    t.text     'description'
    t.integer  'user_id'
    t.index ['user_id'], name: 'index_services_on_user_id', using: :btree
  end

  create_table 'taggings', force: :cascade do |t|
    t.integer  'tag_id'
    t.string   'taggable_type'
    t.integer  'taggable_id'
    t.string   'tagger_type'
    t.integer  'tagger_id'
    t.string   'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context', using: :btree
    t.index %w(tag_id taggable_id taggable_type context tagger_id tagger_type), name: 'taggings_idx', unique: true, using: :btree
    t.index ['tag_id'], name: 'index_taggings_on_tag_id', using: :btree
    t.index %w(taggable_id taggable_type context), name: 'index_taggings_on_taggable_id_and_taggable_type_and_context', using: :btree
    t.index %w(taggable_id taggable_type tagger_id context), name: 'taggings_idy', using: :btree
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id', using: :btree
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type', using: :btree
    t.index %w(tagger_id tagger_type), name: 'index_taggings_on_tagger_id_and_tagger_type', using: :btree
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id', using: :btree
  end

  create_table 'tags', force: :cascade do |t|
    t.string  'name'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true, using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'first_name'
    t.string   'email', default: '', null: false
    t.string   'region'
    t.string   'telephone'
    t.string   'stars'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string   'encrypted_password', default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end

  add_foreign_key 'classifieds', 'categories'
  add_foreign_key 'flags', 'classifieds'
  add_foreign_key 'flags', 'users'
  add_foreign_key 'mailboxer_conversation_opt_outs', 'mailboxer_conversations', column: 'conversation_id', name: 'mb_opt_outs_on_conversations_id'
  add_foreign_key 'mailboxer_notifications', 'mailboxer_conversations', column: 'conversation_id', name: 'notifications_on_conversation_id'
  add_foreign_key 'mailboxer_receipts', 'mailboxer_notifications', column: 'notification_id', name: 'receipts_on_notification_id'
  add_foreign_key 'photos', 'services'
  add_foreign_key 'services', 'users'
end
