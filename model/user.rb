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
        login, user_id, name, password, password_confirmation, is_admin =
            hash.values_at(*%w[login user_id name password
                           password_confirmation is_admin])
        user = new(:login => login, :user_id => user_id, :name => name,
                   :password => password, 
                   :password_confirmation => password_confirmation,
                   :is_admin => is_admin)
        user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}--#{user.login}--")
        user
    end

    def change_password (new_password)
        self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}--#{self.login}--")
        self.crypted_password = self.class.encrypt(new_password, self.salt)
        save    
    end

    # Database access
    def my_list
        observations_dataset.eager(:bird).order(:first_date.desc) 
    end

    def unseen_list
        Bird.filter(~:bto_code=> Observation.filter(:user_id=>user_id).
                    select(:bto_code), ~:gos_code=>nil).order(:name)
    end

    #overwrite inherited instance methods
    def after_create
        super
        self.crypted_password = self.class.encrypt(password, salt)
        @new = false
        save
    end

    def before_create
        self.updated_at = self.created_at = Time.now  
        super
    end

    def before_save
        self.updated_at = Time.now
        super
    end

    # Remember until next year
    #    def remember_me
    #        self.remember_token_expire_at = Time.now.utc + (1 * 365 * 24 * 60 * 60)
    #        self.remember_token ||= "#{uuid}-#{uuid}"
    #    end

    def authenticated?(password)
        crypted_password == encrypt(password)
    end

    def encrypt(password)
        self.class.encrypt(password, salt)
    end

    private

    def uuid
        return rand(1e128)
    end

end
