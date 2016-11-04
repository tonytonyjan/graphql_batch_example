# frozen_string_literal: true
require 'graphql'
require_relative 'loader'

UserType = GraphQL::ObjectType.define do
  name 'User'
  field :id, !types.ID
  field :name, !types.String
  field :posts, types[PostType] do
    resolve ->(obj, _args, _ctx) do
      OneToManyLoader.for(Post, :user_id).load(obj.id.to_s)
    end
  end
end

PostType = GraphQL::ObjectType.define do
  name 'Post'
  field :id, !types.ID
  field :title, !types.String
  field :content, !types.String
  field :user, UserType do
    resolve ->(obj, _args, _ctx) do
      RecordLoader.for(User).load(obj.user_id.to_s)
    end
  end
  field :tags, types[TagType] do
    resolve ->(obj, _args, _ctx) do
      ManyToManyLoader.for(Tag, :posts_tags, :post_id).load(obj.id.to_s)
    end
  end
end

TagType = GraphQL::ObjectType.define do
  name 'Tag'
  field :id, !types.ID
  field :name, !types.String
  field :posts, types[PostType] do
    resolve ->(obj, _args, _ctx) do
      ManyToManyLoader.for(Post, :posts_tags, :tag_id).load(obj.id.to_s)
    end
  end
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  field :user do
    type UserType
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) do
      RecordLoader.for(User).load(args['id'])
    end
  end

  field :post do
    type PostType
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) do
      RecordLoader.for(Post).load(args['id'])
    end
  end

  field :tag do
    type TagType
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) do
      RecordLoader.for(Tag).load(args['id'])
    end
  end
end
