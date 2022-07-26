# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :github, Types::GhithubObjectType, null: false do
      argument :login, String, required: true
    end

    def github(login:)
      GithubService.new(login).call
    end
  end
end
