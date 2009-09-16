require 'digest'

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

    # class methods
    def self.encrypt(password, salt)
	Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def self.authenticate(hash)
	#	if oid = hash['openid']
	#	    User[:openid => oid]
	#	else
	login, pass = hash['login'], hash['password']

	if user = User[:login => login]
	    # we don't store the password in the session...
	    return user unless pass 		
	    user if user.authenticated?(pass)
	end
	#	end
    end
    
   # overwrite inherited instance method
    def after_create
	super
	self.crypted_password = self.class.encrypt('password', 'salt')
	@new = false
	save
    end

    if empty?
	create :login => 'garsiden', :is_admin=>true
    end

    def authenticated?(password)
	crypted_password == encrypt(password)
    end

    def encrypt(password)
	self.class.encrypt(password, 'salt')
    end

    

end
