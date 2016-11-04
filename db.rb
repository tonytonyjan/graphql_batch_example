# frozen_string_literal: true
require 'sequel'
require_relative 'seed'

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  String :name
end

DB.create_table :posts do
  primary_key :id
  String :title
  String :content
  foreign_key :user_id, :users
end

DB.create_table :tags do
  primary_key :id
  String :name
end

DB.create_table :posts_tags do
  foreign_key :post_id, :posts
  foreign_key :tag_id, :tags
  unique %i(post_id tag_id)
end

SEED.each do |table_name, rows|
  rows.each do |values|
    DB[table_name].insert values
  end
end

class User < Sequel::Model
  one_to_many :posts
end

class Post < Sequel::Model
  many_to_one :user
  many_to_many :tags
end

class Tag < Sequel::Model
  many_to_many :posts
end
