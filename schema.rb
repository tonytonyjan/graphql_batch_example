# frozen_string_literal: true
require_relative 'types'

Schema = GraphQL::Schema.define do
  query QueryType
end
