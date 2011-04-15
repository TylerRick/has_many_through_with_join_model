module WithJoinModel
  # class Group
  #   has_many :users, :through => :memberships, :extend => WithJoinModel
  # end
  #
  # group.users.with_join.map(&:join) # => [<Membership>, <Membership>, ...]
  #
  def with_join
    # Local variables can be accessed from the closure -- the methods can't be called directly there
    proxy_owner      = proxy_owner()
    proxy_reflection = proxy_reflection()
    # method_name    = :memberships.                            to_s.singularize.to_sym
    method_name      = proxy_reflection.through_reflection.name.to_s.singularize.to_sym

    # Add methods to each element in this collection
    proxy_target.map do |element|

      singleton_class = element.respond_to?(:singleton_class) ? element.singleton_class : element.metaclass

      # user. metaclass.send(:define_method, :join) do
      element.singleton_class.send(:define_method, :join) do
        # memberships = send(:memberships)
        join_objects  = send(proxy_reflection.through_reflection.name)
        # memberships.detect {|membership| user.send('group_id')                        == group.      id}
        join_objects. detect {|element| element.send(proxy_reflection.primary_key_name) == proxy_owner.id}
      end

      element.singleton_class.send(:alias_method, :through, :join)

      # Also alias a method named after the join/through table itself
      # element.metaclass.send(:alias_method, :membership, :join)
      element.singleton_class.send(:alias_method, method_name, :join)
      # (This also works:)
      #element.metaclass.send(:define_method, method_name, element.method(:join))

      element
    end
  end
end
