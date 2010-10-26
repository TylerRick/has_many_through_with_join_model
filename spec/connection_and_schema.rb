ActiveRecord::Base.establish_connection({
  :database => ":memory:",
  :adapter  => 'sqlite3',
  :timeout  => 500
})

ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.string  :name
  end
  create_table :groups, :force => true do |t|
    t.string  :name
  end
  create_table :memberships, :force => true do |t|
    t.belongs_to :user
    t.belongs_to :group
    t.string  :title
  end
end
