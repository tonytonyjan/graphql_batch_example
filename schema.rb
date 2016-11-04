# frozen_string_literal: true
require 'graphql/batch'
require_relative 'types'

Schema = GraphQL::Schema.define do
  query QueryType
  query_execution_strategy GraphQL::Batch::ExecutionStrategy
end
