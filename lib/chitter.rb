require 'pg'

class Chitter
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      peep['text']
    end
  end



end