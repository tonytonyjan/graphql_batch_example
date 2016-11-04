# frozen_string_literal: true
require 'graphql/batch'

class RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(ids)
    @model.where(id: ids).each { |record| fulfill(record.id.to_s, record) }
  end
end

class OneToManyLoader < GraphQL::Batch::Loader
  def initialize(model, key)
    @model = model
    @key = key
  end

  def perform(ids)
    records = @model.where(@key => ids).to_a
    ids.each do |id|
      matching_records = records.select { |r| id == r.send(@key).to_s }
      fulfill(id, matching_records)
    end
  end
end

class ManyToManyLoader < GraphQL::Batch::Loader
  def initialize(model, join_table, key)
    @model = model
    @join_table = join_table
    @key = key
  end

  def perform(ids)
    records = @model.join(@join_table)
                    .select_all(@model.table_name)
                    .select_append(@key)
                    .distinct
                    .where(@key => ids)
                    .all
    ids.each do |id|
      matching_records = records.select { |r| id == r.send(:[], @key).to_s }
      fulfill(id, matching_records)
    end
  end
end
