require 'active_record'

def connect_db!
  ActiveRecord::Base.establish_connection(
    host: 'freshworks-batch-2.c52o448usuop.ap-south-1.rds.amazonaws.com',
    adapter: 'mysql2',
    database: 'bharathwaj_wd201',
    username: 'bharathwaj',
    password: 'bha@2022'
  )
end
