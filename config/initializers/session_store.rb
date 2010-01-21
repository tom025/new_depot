# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_new_depot_session',
  :secret      => '5195a9f94d12a63a0ae5740a0a2bfd4df80007cb11c7136317c159990068cdeccad96aadf50350c4ca8e0d93292df2ae9c30fef00a8ad1bfe2243faf86c90b17'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
