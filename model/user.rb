class User < Sequel::Model(:user)
    set_schema do
	primary_key :id
	varchar :login, :unique=>true
	varchar :openid, :unique=>true
	varchar :crypted_password, :size=>40
	varchar :salt, :size=>40
	datetime :created_at
	datetime :updated_at
	boolean :is_admin, :default=>false
    end

    create_table unless table_exists?
    plugin :timestamps, :update_on_create=>true

    if empty?
	create :login => 'garsiden', :is_admin=>true
    end
end
