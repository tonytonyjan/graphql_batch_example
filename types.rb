require 'graphql'

UserType = GraphQL::ObjectType.define do
  name 'User'
  field :id, !types.ID
  field :name, !types.String
  field :posts, types[PostType]
end

PostType = GraphQL::ObjectType.define do
  name 'Post'
  field :id, !types.ID
  field :title, !types.String
  field :content, !types.String
  field :user, UserType
  field :tags, types[TagType]
end

TagType = GraphQL::ObjectType.define do
  name 'Tag'
  field :id, !types.ID
  field :name, !types.String
  field :posts, types[PostType]
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  field :user do
    type UserType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) do
      User[args['id']]
    end
  end
  field :post do
    type PostType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) do
      Post[args['id']]
    end
  end
  field :tag do
    type TagType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) do
      Tag[args['id']]
    end
  end
end
