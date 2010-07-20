require 'digest'

class User < Sequel::Model
    set_schema do
        primary_key :user_id, :char, :size=>2,
            :null=>false, :auto_increment=>false
        varchar :login, :unique=>true, :null=>false
        varchar :name, :size=>40, :null=>false
        varchar :openid, :unique=>true
        varchar :crypted_password, :size=>40
        varchar :salt, :size=>40
        datetime :created_at
        datetime :updated_at
        boolean :is_admin, :default=>false
    end

    create_table unless table_exists?
    unrestrict_primary_key
    one_to_many :observations
    plugin :timestamps, :update_on_create=>true

    # class methods
    def self.encrypt(password, salt)
        Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def self.authenticate(creds)
        #       if oid = hash['openid']
        #           User[:openid => oid]
        #       else
        login, pass = creds['login'], creds['password']

        if user = User[:login => login]
            # we don't store the password in the session...
            return user unless pass             
            user if user.authenticated?(pass)
        end
        #       end
    end
    
   # overwrite inherited instance method
    def after_create
        super
        self.crypted_password = self.class.encrypt('password', 'salt')
        @new = false
        save
    end

    if empty?
        create :user_id => 'NG', :login => 'garsiden', :name => 'Nigel Garside',
            :is_admin=>true
        create :user_id => 'EW', :login => 'wange', :name => 'Eddie Wang'
    end

    def authenticated?(password)
        crypted_password == encrypt(password)
    end

    def encrypt(password)
        self.class.encrypt(password, 'salt')
    end

    

end
