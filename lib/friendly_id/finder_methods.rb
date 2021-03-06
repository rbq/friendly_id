module FriendlyId
  # These methods will override the finder methods in ActiveRecord::Relation.
  module FinderMethods

    protected

    # FriendlyId overrides this method to make it possible to use friendly id's
    # identically to numeric ids in finders.
    #
    # @example
    #  person = Person.find(123)
    #  person = Person.find("joe")
    #
    # @see FriendlyId::ObjectUtils
    def find_one(id)
      return super if !@klass.respond_to?(:friendly_id) || id.unfriendly_id?
      where(@klass.friendly_id_config.query_field => id).first or super
    end
  end
end
