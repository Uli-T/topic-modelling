require 'csv'

FILE_TO_PARSE = ARGV[0] || '1000.csv'

params = {
  :col_sep => "\t",
  :row_sep => "\r\n",
  :quote_char => '"',
  :headers => true
}

count = 0

CSV.foreach(FILE_TO_PARSE, params) do |row|
  if count > 100
    exit
  end

  count += 1
  File.open("test_input/#{row['_id'].gsub(':', '_')}.txt", 'w') do |f|
    f.write row['text_content']
  end
end
