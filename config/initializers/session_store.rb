# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_insta-microsite-maker_session',
  :secret      => '9de2cf3f690792c38d95bbe4b57aa0adfa355d45385188d9a3161a66929c18a1d3ec85130523363d330820baeeba255529337769c6fbfe813b7e02e84bab7dc4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
