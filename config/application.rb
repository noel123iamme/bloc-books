require "bloc_works"
require "bloc_record"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "models")

BlocRecord.connect_to("db/db.sqlite", "sqlite3")

module BlocBooks
  class Application < BlocWorks::Application

  end
end
