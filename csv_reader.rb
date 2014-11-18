# ruby -s csv_reader.rb [-truncate] input_file1.csv [input_file2.csv]
require 'csv'

FILES_TO_PARSE = ARGV

params = {
  :col_sep => "\t",
  :row_sep => "\r\n",
  :quote_char => '"',
  :headers => true
}

#count = 1
threads = []

FILES_TO_PARSE.each do |file|
  threads << Thread.new do
    CSV.foreach(file, params) do |row|
#      if $truncate
#        count > 100 ? exit : count += 1
#      end

      File.open("test_input/#{row['_id'].gsub(':', '_')}.txt", 'w') do |f|
        f.write row['text_content']
      end
    end
  end
end

threads.each(&:join)
