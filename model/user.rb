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

    # For validation
    attr_accessor :password, :password_confirmation

    # class methods
    def self.encrypt(password, salt)
        Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def self.authenticate(creds)
        login, pass = creds['login'], creds['password']

        if user = User[:login => login]
            # we don't store the password in the session...
            return user unless pass             
            user if user.authenticated?(pass)
        end
    end

    def self.prepare(hash)
        login, user_id, name, password, password_confirmation =
            hash.values_at(*%w[login user_id name password
                           password_confirmation])
        user = new(:login => login, :user_id => user_id, :name => name,
                   :password => password, 
                   :password_confirmation => password_confirmation)
        user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}--#{user.login}--")
        user
    end

    # overwrite inherited instance method
    def after_create
        super
        self.crypted_password = self.class.encrypt(password, salt)
        @new = false
        save
    end

    def authenticated?(password)
        crypted_password == encrypt(password)
    end

    def encrypt(password)
        self.class.encrypt(password, salt)
    end

    if empty?
        #  create :user_id => 'EW', :login => 'wange', :name => 'Eddie Wang'
        h =  {'user_id' => 'NG', 'login' => 'garsiden',
            'name' => 'Nigel Garside', 'password' => 'maggio26',
            'password_confirmation' => 'maggio26'}
        user = self.prepare(h)
        user.is_admin = true
        user.save
        h =  {'user_id' => 'EW', 'login' => 'wange',
            'name' => 'Eddie Wang', 'password' => 'dicembre21',
            'password_confirmation' => 'dicembre21'}
        user = self.prepare(h)
        user.is_admin = true
        user.save
    end
end
