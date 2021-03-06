# frozen_string_literal: true
require_relative 'init'
require 'pp'

query = %(
  {
    tag(id: 1) {
      id, name, posts {
        id, title, user {
          id, name, posts {
            title, content
          }
        }
      }
    }
  }
)
pp Schema.execute query
